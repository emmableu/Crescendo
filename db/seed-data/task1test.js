// var categoryID = "variable";  // e.g. "BJCx"
// var preReqTaskID = null;
// // Specify a prerequisite task id, should be null if no such requirement.
// var taskID = '1';
var id = 'somevarid';
var isEDX = isEDXurl();
// if this question is not meant to be graded, change this flag to false
var graded = true;
// to hide feedback for this problem, set this to false
var showFeedback = true;
// to allow ability to regrade certain tests, set this to true
var regradeOn = true;
// var chunk_1 = fb.newChunk('Make the (list test %) block.');

function AGTest(outputLog) {
    var fb = new FeedbackLog(
        world,
        id
        // 'Generate a list of coordinates'
     );

    // var moveBlock = "move % steps";
    var blocks =["move %n steps","turn %clockwise %n degrees","turn %counterclockwise %n degrees"];

    var i = 0;
    var len = blocks.length;

    for (; i < len; ) {
        block = blocks[i];
        blockImg = AG_UTIL.HTMLFormattedBlock(block);
        chunk = fb.newChunk('');

        var tip = chunk.newTip(
            'Make sure you name your block exactly ' + blockImg + ' and place it in the scripting area.',
            'Found the ' + blockImg + ' block in the scripting area.'
        );

        var blockExists = function () {
            return spriteContainsBlock(block);
        }

        tip.newAssertTest(
            blockExists,
            "Testing if the " + blockImg + " block is in the scripting area.",
            "The " + blockImg + " block is in the scripting area.",
            "Make sure you name your block exactly " + blockImg + " and place it in the scripting area.",
            0
        );
        i++;
    }
    return fb;
}

