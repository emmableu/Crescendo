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
        return IfDoExistsInInnerForever('down arrow','change y by %n');
    };

    tip.newAssertTest(
        blockExists1,
        "newasserttest1",
        "Monkey moves down when the down key is pressed",
        "Monkey needs to move down when the down key is pressed!",
        0
    );



    chunk2 = fb.newChunk('');

    var tip = chunk2.newTip(
        "Draw a newtip1s",
        'newtip2',
        'newtip3'
    );

    var blockExists2 = function () {
        return IfDoExistsInInnerForever('space','next costume');
    };

    tip.newAssertTest(
        blockExists2,
        "newasserttest1",
        "Monkey is dancing when the space key is pressed.",
        "Monkey should be dancing when the space key is pressed!",
        0
    );

    return fb;







}



