

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
        scriptsOnScreen = getScripts(0);
        script = scriptsOnScreen[0];
        var script = JSONscript(script);
        foreverScript = subScript(script, 'forever %loop');

        for (var i = 0; i < foreverScript.length; i++) {
            morph1 = foreverScript[i];
            type1 = typeof(morph1);
            if ((type1 === "string")) {
                continue;
            }  else if (blockSpecMatch(morph1.blockSp, 'if %b %c else %c')) {
                    if (blockSpecMatch(morph1.inputs[0].inputs[0], 'mouse x')){
                        innerIfScript = morph1.inputs[1];
                        if (innerIfScript[0].blockColor.r === 56 &&
                            innerIfScript[0].blockColor.g === 160 &&
                            innerIfScript[0].blockColor.b === 0) {
                            return true;
                        }
                }
            }

        }


    };

    tip.newAssertTest(
        blockExists1,
        "newasserttest1",
        "Sprite draws green on the left",
        "Sprite should draw green on the left!",
        0
    );



    chunk2 = fb.newChunk('');

    var tip = chunk2.newTip(
        "Draw a newtip1s",
        'newtip2',
        'newtip3'
    );

    var blockExists1 = function () {
        scriptsOnScreen = getScripts(0);
        script = scriptsOnScreen[0];
        var script = JSONscript(script);
        foreverScript = subScript(script, 'forever %loop');
        ifElseScript = subScript(foreverScript, 'if %b %c else %c', 'else');
        if (blockSpecMatch(ifElseScript[0].inputs[0].blockSp, '%s < %s')){
            if (ifElseScript[0].inputs[0].inputs[0] === 'mouse y') {
                innerIfScript = subScript(ifElseScript, 'if %b %c else %c', 'if');
                if (innerIfScript[0].blockColor.r === 255 &&
                    innerIfScript[0].blockColor.g === 3 &&
                    innerIfScript[0].blockColor.b === 54) {
                    return true;
                }
            }
        }


    };

    tip.newAssertTest(
        blockExists1,
        "newasserttest1",
        "Sprite draws red on the bottom right",
        "Sprite should draw red on the bottom right!",
        0
    );










    chunk3 = fb.newChunk('');

    var tip = chunk3.newTip(
        "Draw a newtip1s",
        'newtip2',
        'newtip3'
    );

    var blockExists1 = function () {
        scriptsOnScreen = getScripts(0);
        script = scriptsOnScreen[0];
        var script = JSONscript(script);
        foreverScript = subScript(script, 'forever %loop');
        ifElseScript = subScript(foreverScript, 'if %b %c else %c', 'else');

        innerIfScript = subScript(ifElseScript, 'if %b %c else %c', 'else');
        if (innerIfScript[0].blockColor.r === 255 &&
            innerIfScript[0].blockColor.g === 249 &&
            innerIfScript[0].blockColor.b === 34) {
            return true;
        }


    };

    tip.newAssertTest(
        blockExists1,
        "newasserttest1",
        "Sprite draws yellow on the top right",
        "Sprite should draw yellow on the top right!",
        0
    );


    return fb;







}






