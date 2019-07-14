

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

    var blockExists2 = function () {
        if (SeriesOfBlockSpecInSprite([ "go to x: %n y: %n", "face random direction", "move forward", "turn %clockwise %n degrees",
        "move forward", "if %b %c"])) {
            return true;
        }
        ;
        // };
        return false;
    };

    tip.newAssertTest(
        blockExists2,
        "newasserttest1",
        "The ladybug always turn right and move forward (to a corner)",
        "You are close! Just need to make the ladybug always turn right and move forward (to a corner)",
        0
    );




    chunk2 = fb.newChunk('');

    var tip = chunk2.newTip(
        "Draw a newtip1s",
        'newtip2',
        'newtip3'
    );

    var blockExists2 = function () {
        scriptsOnScreen = getScripts(0);
        script = scriptsOnScreen[0];
        var script = JSONscript(script);
        ifScript = subScript(script, 'if %b %c');
        // ifblock = subScript('')
        return blockSpecMatch(ifScript[0].blockSp, "move forward");
    };

    tip.newAssertTest(
        blockExists2,
        "newasserttest1",
        "Great! The ladybug moves forward when touching <img src=\"/assets/black.png\" />",
        "The ladybug needs to be able to move forward when touching <img src=\"/assets/black.png\" />",
        0
    );



    return fb;







}


