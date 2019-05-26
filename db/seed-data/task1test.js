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
            "The " + blockImg + " is not in the scripting area",
            0
        );
        i++;
    }
    return fb;
}

