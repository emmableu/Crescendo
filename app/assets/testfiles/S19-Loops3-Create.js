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
        return SeriesOfBlockSpecInInnerRepeat(["draw a triangle with %s size"]);

    };

    tip.newAssertTest(
        blockExists1,
        "newasserttest1",
        "You have successfully drawn 15 triangles in each row!",
        "Please draw 15 triangles in each row!",
        0
    );


    chunk2 = fb.newChunk('');

    var tip = chunk2.newTip(
        "Draw a newtip1s",
        'newtip2',
        'newtip3'
    );

    var blockExists1 = function () {
        return SeriesOfBlockSpecInInnerRepeat([ "change pen %hsva by %n"]);

    };

    tip.newAssertTest(
        blockExists1,
        "newasserttest1",
        "Pen color is changed a little bit in each row!",
        "Please change pen color in each row!",
        0
    );






    chunk3 = fb.newChunk('');

    var tip = chunk3.newTip(
        "Draw a newtip1s",
        'newtip2',
        'newtip3'
    );

    var blockExists2 = function () {
        return SeriesOfBlockSpecInOuterRepeat(["set x to %n"]);

    };

    tip.newAssertTest(
        blockExists2,
        "newasserttest1",
        "x is back to left",
        "move x to left after drawing each row!",
        0
    );


    chunk4 = fb.newChunk('');

    var tip = chunk4.newTip(
        "Draw a newtip1s",
        'newtip2',
        'newtip3'
    );

    var blockExists2 = function () {
        return SeriesOfBlockSpecInOuterRepeat(["change y by %n"]);

    };

    tip.newAssertTest(
        blockExists2,
        "newasserttest1",
        "move y down after each row",
        "You need to move y down after each row!",
        0
    );



    return fb;







}



