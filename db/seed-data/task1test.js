var categoryID = "variable";  // e.g. "BJCx"
var preReqTaskID = null;
// Specify a prerequisite task id, should be null if no such requirement.
var taskID = '1';
var id = categoryID + taskID;
var isEDX = isEDXurl();
// if this question is not meant to be graded, change this flag to false
var graded = true;
// to hide feedback for this problem, set this to false
var showFeedback = true;
// to allow ability to regrade certain tests, set this to true
var regradeOn = true;
function AGTest(outputLog) {
    var fb = new FeedbackLog(
        world,
        id,
        'Generate a list of coordinates'
     );

    var moveBlock = "move % steps";
    blockImg = AG_UTIL.HTMLFormattedBlock(moveBlock);
    chunk_2 = fb.newChunk('Let\'s test merge using ' + blockImg + '.');

    var tip_2_1 = chunk_1.newTip(
        'Make sure you name your block exactly ' + blockImg + ' and place it in the scripting area.',
        'Found the ' + blockImg + ' block in the scripting area.'
    );

    var blockExists_1 = function () {
        return spriteContainsBlock(sortBlock);
    }

    tip_2_1.newAssertTest(
        blockExists_1,
        "Testing if the " + blockImg + " block is in the scripting area.",
        "The " + blockImg + " block is in the scripting area.",
        "Make sure you name your block exactly " + blockImg + " and place it in the scripting area.",
        0
    );


    var sortBlock = "sort %";
    blockImg = AG_UTIL.HTMLFormattedBlock(sortBlock);
    chunk_2 = fb.newChunk('Let\'s test merge using ' + blockImg + '.');

    var tip_2_1 = chunk_1.newTip(
        'Make sure you name your block exactly ' + blockImg + ' and place it in the scripting area.',
        'Found the ' + blockImg + ' block in the scripting area.'
    );

    var blockExists_2 = function () {
        return spriteContainsBlock(sortBlock);
    }

    tip_2_1.newAssertTest(
        blockExists_2,
        "Testing if the " + blockImg + " block is in the scripting area.",
        "The " + blockImg + " block is in the scripting area.",
        "Make sure you name your block exactly " + blockImg + " and place it in the scripting area.",
        0
    );


    return fb;
}