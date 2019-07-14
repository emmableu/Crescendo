

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

    //
    //
    // chunk1 = fb.newChunk('');
    //
    // var tip = chunk1.newTip(
    //     "Draw a newtip1s",
    //     'newtip2',
    //     'newtip3'
    // );
    //
    // var blockExists2 = function () {
    //     if (SeriesOfBlockSpecInSprite([ "go to x: %n y: %n", "face random direction", "move forward", "turn %clockwise %n degrees",
    //          "if %b %c", "if %b %c", "if %b %c", "if %b %c"])) {
    //         return true;
    //     }
    //     ;
    //     // };
    //     return false;
    // };
    //
    // tip.newAssertTest(
    //     blockExists2,
    //     "newasserttest1",
    //     "There are four separate if conditions in this task",
    //     "There are four separate if conditions in this task",
    //     0
    // );




    chunk2 = fb.newChunk('');

    var tip = chunk2.newTip(
        "Draw a newtip1s",
        'newtip2',
        'newtip3'
    );

    var blockExists2 = function () {
            if (SeriesOfBlockSpecInSprite([ "go to x: %n y: %n", "face random direction", "move forward", "turn %clockwise %n degrees",
                 "if %b %c", "if %b %c", "if %b %c", "if %b %c"])) {
                return (IfTouchingSeries([255, 139, 6], 1) && IfTouchingSeries([228, 236, 0], 2) && IfTouchingSeries([255, 57, 248], 3)
                    && IfTouchingSeries([242, 24, 0], 4));
            }

    };

    tip.newAssertTest(
        blockExists2,
        "newasserttest1",
        "The color in each if block are ordered clockwise, starting from the <img src=\"/assets/orange.png\" /> color",
        "What happens if the ladybug faces <img src=\"/assets/orange.png\" />? how about <img src=\"/assets/yellow2.png\" />, <img src=\"/assets/purple.png\" /> and <img src=\"/assets/red.png\" />?",
        0
    );





    chunk3 = fb.newChunk('');

    var tip = chunk3.newTip(
        "Draw a newtip1s",
        'newtip2',
        'newtip3'
    );

    var blockExists2 = function () {
        return (SeriesOfBlockSpecInIfTouching(['move forward', 'turn %clockwise %n degrees', 'move forward'], [255, 139, 6]));
    };

    tip.newAssertTest(
        blockExists2,
        "newasserttest1",
        "The ladybug moves from <img src=\"/assets/orange.png\" /> to <img src=\"/assets/yellow2.png\" /> when touching <img src=\"/assets/orange.png\" />",
        "If the ladybug touches <img src=\"/assets/orange.png\" />, it needs to go to the <img src=\"/assets/yellow2.png\" /> block",
        0
    );






    chunk4 = fb.newChunk('');

    var tip = chunk4.newTip(
        "Draw a newtip1s",
        'newtip2',
        'newtip3'
    );

    var blockExists2 = function () {
        return (SeriesOfBlockSpecInIfTouching(['move forward', 'turn %clockwise %n degrees', 'move forward'], [228, 236, 0]));
    };

    tip.newAssertTest(
        blockExists2,
        "newasserttest1",
        "The ladybug moves from <img src=\"/assets/yellow2.png\" /> to <img src=\"/assets/purple.png\" /> when touching <img src=\"/assets/yellow2.png\" />",
        "If the ladybug touches <img src=\"/assets/yellow2.png\" />, it needs to go to the <img src=\"/assets/purple.png\" /> block",

        0
    );




    chunk5 = fb.newChunk('');

    var tip = chunk5.newTip(
        "Draw a newtip1s",
        'newtip2',
        'newtip3'
    );

    var blockExists2 = function () {
        return (SeriesOfBlockSpecInIfTouching(['move forward', 'turn %clockwise %n degrees', 'move forward'], [255, 57, 248]));
    };

    tip.newAssertTest(
        blockExists2,
        "newasserttest1",
        "The ladybug moves from <img src=\"/assets/purple.png\" /> to <img src=\"/assets/red.png\" /> when touching <img src=\"/assets/purple.png\" />",
        "If the ladybug touches <img src=\"/assets/purple.png\" />, it needs to go to the <img src=\"/assets/red.png\" /> block",

        0
    );

    chunk6 = fb.newChunk('');

    var tip = chunk6.newTip(
        "Draw a newtip1s",
        'newtip2',
        'newtip3'
    );

    var blockExists2 = function () {
        return (SeriesOfBlockSpecInIfTouching(['move forward'], [242, 24, 0]));
    };

    tip.newAssertTest(
        blockExists2,
        "newasserttest1",
        "Congrats! The ladybug moves from <img src=\"/assets/red.png\" /> to <img src=\"/assets/green.png\" />",
        "One last step to move from <img src=\"/assets/red.png\" /> to <img src=\"/assets/green.png\" />",

        0
    );







    return fb;







}


