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
        if(SeriesOfBlockSpecInRepeat(["draw a square with %s size", "draw a triangle with %s size"], 1)){
            return true;
        };
        // };
        return false;
    };

    tip.newAssertTest(
        blockExists1,
        "newasserttest1",
        "The first row of teeth is correct!",
        "Please make the first row of teeth 3 series of square and triangles!",
        0
    );














    chunk2 = fb.newChunk('');

    var tip = chunk2.newTip(
        "Draw a newtip1s",
        'newtip2',
        'newtip3'
    );

    var blockExists2 = function () {

        if(SeriesOfBlockSpecInRepeat(["draw a triangle with %s size", "draw a square with %s size"], 2)){
            return true;
        };
    };

    tip.newAssertTest(
        blockExists2,
        "newasserttest1",
        "The second row of teeth is correct!",
        "Please make the second row of teeth 3 series of triangle and square!",
        0
    );


}



