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

    var blockExists = function () {
        return findBlockInPalette("draw a square with %s size");

    };

    tip.newAssertTest(
        blockExists,
        "newasserttest1",
        "newasserttest2",
        "newasserttest3",
        0
    );

    var blocks =["draw a square with %n size", "stamp"];
    block = blocks[0];
    chunk2 = fb.newChunk('');

    var tip = chunk2.newTip(
        "chunk2 tip 1",
        'chunk2 tip 2',
        'chunk2 tip 3'
    );

    var blockExists = function () {
        return spriteContainsBlock(block);
    };

    tip.newAssertTest(
        blockExists,
        "chunk2 assert test 1",
        "chunk2 assert test 2",
        "chunk2 assert test 3",
        0
    );
    return fb;
}






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
//      );
//     var blocks =["draw a square with %n size", "stamp"];
//     var i = 0;
//     var len = blocks.length;
//         block = blocks[i];
//         chunk1 = fb.newChunk('');
//
//         var tip = chunk.newTip(
//             "Draw a s"
//             'Make sure you name your block exactly ' + blockImg + ' and place it in the scripting area.',
//             'Found the ' + blockImg + ' block in the scripting area.'
//         );
//
//         var blockExists = function () {
//             return spriteContainsBlock(block);
//         }
//
//         tip.newAssertTest(
//             blockExists,
//             "Testing if the " + blockImg + " block is in the scripting area.",
//             "The " + blockImg + " block is in the scripting area.",
//             "The " + blockImg + " is not in the scripting area",
//             0
//         );
//         i++;
//     return fb;
// }
//
