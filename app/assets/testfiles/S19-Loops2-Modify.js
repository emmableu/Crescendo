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
        if (SeriesOfBlockSpecInRepeat(["move %n steps"], 1) && SeriesOfBlockSpecInRepeat(["draw a triangle with %s size"], 1)) {
            return true;
        }
        ;
        // };
        return false;
    };

    tip.newAssertTest(
        blockExists1,
        "newasserttest1",
        "You have drawn 5 triangles!",
        "Please draw 5 triangles and have gaps between them",
        0
    );



    if(SeriesOfBlockSpecInRepeat(["move %n steps",  "draw a triangle with %s size"], 1)) {



        chunk2 = fb.newChunk('');

        var tip = chunk2.newTip(
            "Draw a newtip1s",
            'newtip2',
            'newtip3'
        );

        var blockExists2 = function () {
            if (SeriesOfBlockSpecInSprite(["repeat %n %loop", "move %n steps", "draw a square with %s size"])) {

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

    }
    else if(SeriesOfBlockSpecInRepeat(["draw a triangle with %s size","move %n steps" ], 1)){


        chunk2 = fb.newChunk('');

        var tip = chunk2.newTip(
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

    }

    return fb;







}



