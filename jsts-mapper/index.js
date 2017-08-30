#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const {SourceMapConsumer} = require('source-map');

require('yargs')
	.usage('$0 <cmd> [args]')
	.command('orig [file] [line] [column]', 'compute the original source location for the generated file:line:col', {}, orig)
	.command('gen [file] [line] [column]', 'compute the generated source location for the original file:line:col', {}, gen)
  .help()
  .argv;

function gen(argv) {
	const {file, line, column} = argv;
	const generatedFilename = path.resolve(file).replace('/src/', '/dist/').replace(/\.ts$/, '.js');
	const sourceMapFilename = generatedFilename + '.map';
	const source = path.relative(path.parse(generatedFilename).dir, file);
	const rawSourceMap = JSON.parse(fs.readFileSync(sourceMapFilename));
	const smc = new SourceMapConsumer(rawSourceMap);
	const generatedPosition = smc.generatedPositionFor({line, column, source});

	console.log(`${generatedFilename}:${generatedPosition.line}:${generatedPosition.column}`);
}

function orig(argv) {
	const {file, line, column} = argv;
	const originalFilename = path.resolve(file).replace('/dist/', '/src/').replace(/\.js$/, '.ts');
	const sourceMapFilename = path.resolve(file) + '.map';
	const rawSourceMap = JSON.parse(fs.readFileSync(sourceMapFilename));
	const smc = new SourceMapConsumer(rawSourceMap);
	const originalPosition = smc.originalPositionFor({line, column});

	console.log(`${originalFilename}:${originalPosition.line}:${originalPosition.column}`);
}
