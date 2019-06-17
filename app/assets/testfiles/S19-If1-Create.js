
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
        return IfDoInputExistsInInnerForever('left arrow','change x by %n', '-5');
    };

    tip.newAssertTest(
        blockExists1,
        "newasserttest1",
        "Monkey moves left when the left key is pressed",
        "Monkey needs to move left when the left key is pressed!",
        0
    );



    chunk2 = fb.newChunk('');

    var tip = chunk2.newTip(
        "Draw a newtip1s",
        'newtip2',
        'newtip3'
    );

    var blockExists1 = function () {
        return IfDoInputExistsInInnerForever('right arrow','change x by %n', '5');
    };

    tip.newAssertTest(
        blockExists1,
        "newasserttest1",
        "Monkey moves right when the left key is pressed",
        "Monkey needs to move right when the right key is pressed!",
        0
    );


    IfTouchingDoExistsInInnerForever




    chunk3 = fb.newChunk('');

    var tip = chunk3.newTip(
        "Draw a newtip1s",
        'newtip2',
        'newtip3'
    );

    var blockExists1 = function () {
        return IfTouchingDoExistsInInnerForever('say %s for %n secs');
    };

    tip.newAssertTest(
        blockExists1,
        "newasserttest1",
        "Monkey says 'yum yum' when touching an apple",
        "Monkey should say 'yum yum' when touching an apple",
        0
    );




    return fb;







}



