
// var id = 'somevarid';
// var isEDX = isEDXurl();
// var graded = true;
// var showFeedback = true;
// var regradeOn = true;
//
// function AGTest(outputLog) {
//     var fb = new FeedbackLog(
//         world,
//         id
//
//     );
//
//     chunk1 = fb.newChunk('');
//
//     var tip = chunk1.newTip(
//         "Draw a newtip1s",
//         'newtip2',
//         'newtip3'
//     );
//
//     var blockExists = function () {
//         return findBlockInPalette("draw a square with %s size");
//
//     };
//
//     tip.newAssertTest(
//         blockExists,
//         "newasserttest1",
//         "newasserttest2",
//         "newasserttest3",
//         0
//     );
//
//     var blocks =["draw a square with %n size", "stamp"];
//     block = blocks[0];
//     chunk2 = fb.newChunk('');
//
//     var tip = chunk2.newTip(
//         "chunk2 tip 1",
//         'chunk2 tip 2',
//         'chunk2 tip 3'
//     );
//
//     var blockExists = function () {
//         return spriteContainsBlock(block);
//     };
//
//     tip.newAssertTest(
//         blockExists,
//         "chunk2 assert test 1",
//         "chunk2 assert test 2",
//         "chunk2 assert test 3",
//         0
//     );
//     return fb;
// }
//
//
//


var id = 'somevarid';
var isEDX = isEDXurl();
var graded = true;
var showFeedback = true;
var regradeOn = true;

function AGTest(outputLog) {
    var fb = new FeedbackLog(
        world,
        id

    );


    chunk1 = fb.newChunk('');

    var tip = chunk1.newTip(
        "Draw a newtip1s",
        'newtip2',
        'newtip3'
    );

    var blockExists1 = function () {
        scriptsOnScreen = getScripts(0);
        script = scriptsOnScreen[0];
        var script = JSONscript(script);
        foreverScript = subScript(script, 'forever %loop');
        ifElseScript = subScript(foreverScript, 'if %b %c else %c', 'if');
        if (blockSpecMatch(ifElseScript[0].inputs[0].blockSp, '%s < %s')){
            if (ifElseScript[0].inputs[0].inputs[0] === 'x position') {
                innerIfScript = subScript(ifElseScript, 'if %b %c else %c', 'if');
                if (innerIfScript[0].blockColor.r === 252 &&
                    innerIfScript[0].blockColor.g === 0 &&
                    innerIfScript[0].blockColor.b === 19) {
                    return true;
                }
            }
        }


    };

    tip.newAssertTest(
        blockExists1,
        "newasserttest1",
        "<p>Great! The mouse draws <img src=\"/assets/red.png\" /> when hovers over the bottom-left</p>",
        "<p>When the mouse hovers over the bottom-left, it should draw <img src=\"/assets/red.png\" /></p>",
        0
    );





    chunk2 = fb.newChunk('');

    var tip = chunk2.newTip(
        "Draw a newtip1s",
        'newtip2',
        'newtip3'
    );

    var blockExists1 = function () {
        scriptsOnScreen = getScripts(0);
        script = scriptsOnScreen[0];
        var script = JSONscript(script);
        foreverScript = subScript(script, 'forever %loop');
        ifElseScript = subScript(foreverScript, 'if %b %c else %c', 'if');

        innerIfScript = subScript(ifElseScript, 'if %b %c else %c', 'else');
        if (innerIfScript[0].blockColor.r === 248 &&
            innerIfScript[0].blockColor.g === 116 &&
            innerIfScript[0].blockColor.b === 255) {
            return true;
        }


    };

    tip.newAssertTest(
        blockExists1,
        "newasserttest1",
        "<p>Great! The mouse draws <img src=\"/assets/pink.png\" /> when hovers over the bottom-right</p>",
        "<p>When the mouse hovers over the bottom-right, it should draw <img src=\"/assets/pink.png\" /></p>",
        0
    );


    return fb;







}






