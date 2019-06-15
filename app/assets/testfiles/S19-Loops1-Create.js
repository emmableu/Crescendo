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
        if(SeriesOfBlockSpecInRepeat(["draw a square with %s size",  "draw a triangle with %s size",  "draw a triangle with %s size", "draw a square with %s size"], 1)){
            return true;
        };
        // };
        return false;
    };

    tip.newAssertTest(
        blockExists1,
        "newasserttest1",
        "The monster teeth is correct!",
        "Please draw a series of teeth in each repeat!",
        0
    );




    return fb;







}



