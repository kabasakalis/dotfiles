var fs = require('fs');
var json2dts = require('./json2dts.js');
var Json2dts = json2dts.Json2dts;
var toValidJSON = json2dts.toValidJSON;
var yargs = require('yargs');
function getArgs() {
    var args = yargs
        .usage('Converts JSON to Typescript Definition files.\n' +
        'Usage: $0 file.json')
        .describe('output', 'Specifies the file where to write the output')
        .alias('output', 'o')
        .describe('interface', 'Specifies the main interface name')
        .alias('interface', 'i')
        .help('help')
        .example('$0 -i MainInterface file.json', 'Creates Typescript Definition file for the json file.json')
        .strict();
    var files = args.argv._;
    if (!files || files.length === 0) {
        console.error('Please provide a file name');
        args.showHelp();
        process.exit(1);
    }
    return args.argv;
}
function main() {
    var argv = getArgs();
    fs.readFile(argv._[0], 'utf-8', function (err, input) {
        if (err) {
            console.error(err.stack);
            process.exit(2);
        }
        var converter = new Json2dts();
        converter.parse(JSON.parse(toValidJSON(input)), !!argv.interface ? argv.interface : 'RootJson2dts');
        var output = converter.getCode();
        if (!!argv.output) {
            fs.writeFile(argv._[0] + '.d.ts', output, function (err) {
                if (err) {
                    console.error(err.stack);
                    process.exit(2);
                }
            });
        }
        else {
            console.log(output);
        }
    });
}
main();
