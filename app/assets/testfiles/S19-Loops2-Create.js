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
        return SeriesOfBlockSpecInRepeat(["draw a triangle with %s size"], 1);

    };

    tip.newAssertTest(
        blockExists1,
        "newasserttest1",
        "You have drawn 5 triangles!",
        "Please draw 5 triangles!",
        0
    );




    chunk2 = fb.newChunk('');

    var tip = chunk2.newTip(
        "Draw a newtip1s",
        'newtip2',
        'newtip3'
    );

<<<<<<< HEAD
    var blockExists2 = function () {
        return SeriesOfBlockSpecInRepeat(["change pen color by %n"], 1);
=======
    var blockExists1 = function () {
        return SeriesOfBlockSpecInRepeat(["change pen %hsva by %n"], 1);
>>>>>>> a6ec8e319e94e247e0fa9c296e9923b326a2e397

    };

    tip.newAssertTest(
        blockExists1,
        "newasserttest1",
        "Pen color is able to be changed inside repeat",
        "You need to change pen colors inside repeat!",
        0
    );





        chunk3 = fb.newChunk('');

        var tip = chunk3.newTip(
            "Draw a newtip1s",
            'newtip2',
            'newtip3'
        );

        var blockExists2 = function () {
            if (SeriesOfBlockSpecInSprite([ "draw a square with %s size", "move %n steps", "repeat %n %loop"])) {
                return true;
            }
            ;
            // };
            return false;
        };

        tip.newAssertTest(
            blockExists2,
            "newasserttest1",
            " The starting gap is correct!",
            "Please draw a starting gap!",
            0
        );


    chunk4 = fb.newChunk('');

    var tip = chunk4.newTip(
        "Draw a newtip1s",
        'newtip2',
        'newtip3'
    );

    var blockExists2 = function () {
        if (SeriesOfBlockSpecInSprite([  "repeat %n %loop", "move %n steps", "draw a square with %s size",])) {
            return true;
        }
        ;
        // };
        return false;
    };

    tip.newAssertTest(
        blockExists2,
        "newasserttest1",
        " The ending gap is correct!",
        "Please draw an ending gap!",
        0
    );



    return fb;







}



