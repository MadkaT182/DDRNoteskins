--If a Command has "NOTESKIN:GetMetricA" in it, that means it gets the command from the metrics.ini, else use cmd(); to define command.
--If you dont know how "NOTESKIN:GetMetricA" works here is an explanation.
--NOTESKIN:GetMetricA("The [Group] in the metrics.ini", "The actual Command to fallback on in the metrics.ini");



--hehu here we go again, writing noteskins, this time for MadkaT over at ZiV
--lets add a wait state image for him shall we ;)

-- edit this

--_down Wait Receptor.png
WaitStateImage = "Wait Receptor";

--_down Go Receptor.png
NormalReceptor = "Go Receptor";

--wait time before go receptor appears
WaitLength = 5;


-- leave this alone ;)
nskinfix = NOTESKIN:GetPath( '_down', NormalReceptor );

local t = Def.ActorFrame {
Def.Sprite {
Texture=NOTESKIN:GetPath( '_down', WaitStateImage );

--here we go, the important part hehu
InitCommand=function(self)
self:sleep(WaitLength);
self:queuecommand("Go");
end;

GoCommand=function(self)
self:Load(nskinfix);
self:effectclock("beat");
self:SetStateProperties({{Frame= 0, Delay=0.2}, {Frame= 1, Delay=0.8}});
end;

--and rest of the commands
NoneCommand=NOTESKIN:GetMetricA("ReceptorArrow", "NoneCommand");
PressCommand=NOTESKIN:GetMetricA("ReceptorArrow", "PressCommand");
LiftCommand=NOTESKIN:GetMetricA("ReceptorArrow", "LiftCommand");
W5Command=NOTESKIN:GetMetricA("ReceptorArrow", "W5Command");
W4Command=NOTESKIN:GetMetricA("ReceptorArrow", "W4Command");
W3Command=NOTESKIN:GetMetricA("ReceptorArrow", "W3Command");
W2Command=NOTESKIN:GetMetricA("ReceptorArrow", "W2Command");
W1Command=NOTESKIN:GetMetricA("ReceptorArrow", "W1Command");
};
};

-- local t = Def.ActorFrame {
-- 	Def.Sprite {
-- 		Texture=NOTESKIN:GetPath( '_down', 'Go Receptor' );
-- 		Frame0000=0;
-- 		Delay0000=0.2;
-- 		Frame0001=1;
-- 		Delay0001=0.8;
-- 		InitCommand=cmd(effectclock,"beat");
-- 		NoneCommand=NOTESKIN:GetMetricA("ReceptorArrow", "NoneCommand");
-- 		PressCommand=NOTESKIN:GetMetricA("ReceptorArrow", "PressCommand");
-- 		LiftCommand=NOTESKIN:GetMetricA("ReceptorArrow", "LiftCommand");
-- 		W5Command=NOTESKIN:GetMetricA("ReceptorArrow", "W5Command");
-- 		W4Command=NOTESKIN:GetMetricA("ReceptorArrow", "W4Command");
-- 		W3Command=NOTESKIN:GetMetricA("ReceptorArrow", "W3Command");
-- 		W2Command=NOTESKIN:GetMetricA("ReceptorArrow", "W2Command");
-- 		W1Command=NOTESKIN:GetMetricA("ReceptorArrow", "W1Command");
-- 	};
-- };
return t;
