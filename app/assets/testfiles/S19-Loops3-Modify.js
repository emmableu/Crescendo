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
        return SeriesOfBlockSpecInInnerRepeat(["change pen %hsva by %n"]);

    };

    tip.newAssertTest(
        blockExists1,
        "newasserttest1",
        "Pen color is changed in each row!",
        "Please change pen color in each row!",
        0
    );




    chunk2 = fb.newChunk('');

    var tip = chunk2.newTip(
        "Draw a newtip1s",
        'newtip2',
        'newtip3'
    );

    var blockExists2 = function () {
        return SeriesOfBlockSpecInOuterRepeat(["change pen size by %n"]);

    };

    tip.newAssertTest(
        blockExists2,
        "newasserttest1",
        "Pen size is changed between rows!",
        "You need to change pen sizes between each row!",
        0
    );





    return fb;







}



