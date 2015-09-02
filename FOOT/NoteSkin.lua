--I am the bone of my noteskin
--Arrows are my body, and explosions are my blood
--I have created over a thousand noteskins
--Unknown to death
--Nor known to life
--Have withstood pain to create many noteskins
--Yet these hands will never hold anything
--So as I pray, Unlimited Stepman Works

local ret = ... or {};

--Defining on which direction the other directions should be bassed on
--This will let us use less files which is quite handy to keep the noteskin directory nice
--Do remember this will Redirect all the files of that Direction to the Direction its pointed to
--If you only want some files to be redirected take a look at the "custom hold/roll per direction"
ret.RedirTable =
{
	Up = "Down",
	Down = "Down",
	Left = "Down",
	Right = "Down",
	UpLeft = "Down",
	UpRight = "Down",
};

-- < 
--Between here we usally put all the commands the noteskin.lua needs to do, some are extern in other files
--If you need help with lua go to  http://kki.ajworld.net/lua/ssc/Lua.xml there are a bunch of codes there
--Also check out commen it has a load of lua codes in files there
--Just play a bit with lua its not that hard if you understand coding
--But SM can be an ass in some cases, and some codes jut wont work if you dont have the noteskin on FallbackNoteSkin=common in the metric.ini 
local OldRedir = ret.Redir;
ret.Redir = function(sButton, sElement)
	sButton, sElement = OldRedir(sButton, sElement);

	--We want to use custom hold/roll per direction, but
	--Keep global hold/roll heads and explosions.	
	if not string.find(sElement, "Head") and
	not string.find(sElement, "Explosion") then
		if string.find(sElement, "Hold") or
		string.find(sElement, "Roll") then
			return sButton, sElement;
		end
	end
	
	sButton = ret.RedirTable[sButton];
	
	if sElement == "Tap Fake"
	then
		sElement = "Tap Note";
	end
	
	if Var "Button" == "UpLeft" and sElement == "Hold Head Active"
	then sButton = "UpLeft";
	end
	
	if Var "Button" == "UpLeft" and sElement == "Hold Head Inactive"
	then sButton = "UpLeft";
	end
	
	if Var "Button" == "UpLeft" and sElement == "Roll Head Active"
	then sButton = "UpLeft";
	end
	
	if Var "Button" == "UpLeft" and sElement == "Roll Head Inactive"
	then sButton = "UpLeft";
	end
	
	if Var "Button" == "UpRight" and sElement == "Hold Head Active"
	then sButton = "UpRight";
	end
	
	if Var "Button" == "UpRight" and sElement == "Hold Head Inactive"
	then sButton = "UpRight";
	end
	
	if Var "Button" == "UpRight" and sElement == "Roll Head Active"
	then sButton = "UpRight";
	end
	
	if Var "Button" == "UpRight" and sElement == "Roll Head Inactive"
	then sButton = "UpRight";
	end

	return sButton, sElement;
end

local OldFunc = ret.Load;
function ret.Load()
	local t = OldFunc();

	--Explosion should not be rotated; it calls other actors.
	if Var "Element" == "Explosion"	then
		t.BaseRotationZ = nil;
	end
	
	if Var "Button" == "UpLeft" and Var "Element" == "Hold Head Active"	then
		t.BaseRotationZ = nil;
	end
	
	if Var "Button" == "UpLeft" and Var "Element" == "Hold Head Inactive"	then
		t.BaseRotationZ = nil;
	end
	
	if Var "Button" == "UpLeft" and Var "Element" == "Roll Head Active"	then
		t.BaseRotationZ = nil;
	end
	
	if Var "Button" == "UpLeft" and Var "Element" == "Roll Head Inactive"	then
		t.BaseRotationZ = nil;
	end
	
	if Var "Button" == "UpRight" and Var "Element" == "Hold Head Active"	then
		t.BaseRotationZ = nil;
	end
	
	if Var "Button" == "UpRight" and Var "Element" == "Hold Head Inactive"	then
		t.BaseRotationZ = nil;
	end
	
	if Var "Button" == "UpRight" and Var "Element" == "Roll Head Active"	then
		t.BaseRotationZ = nil;
	end
	
	if Var "Button" == "UpRight" and Var "Element" == "Roll Head Inactive"	then
		t.BaseRotationZ = nil;
	end
	
	return t;
end
-- >


-- Parts of noteskins which we want to rotate
ret.PartsToRotate =
{
	["Receptor"] = true,
	["Tap Explosion Bright"] = true,
	["Tap Explosion Dim"] = true,
	["Tap Note"] = true,
	["Tap Fake"] = true,
	["Tap Addition"] = true,
	["Hold Explosion"] = true,
	["Hold Head Active"] = true,
	["Hold Head Inactive"] = true,
	["Roll Explosion"] = true,
	["Roll Head Active"] = true,
	["Roll Head Inactive"] = true,
};
-- Defined the parts to be rotated at which degree
ret.Rotate =
{
	Up = 180,
	Down = 0,
	Left = 90,
	Right = -90,
	UpLeft = 135,
	UpRight = 225,
};

-- Parts that should be Redirected to _Blank.png
-- you can add/remove stuff if you want
ret.Blank =
{
	["Hold Topcap Active"] = true,
	["Hold Topcap Inactive"] = true,
	["Roll Topcap Active"] = true,
	["Roll Topcap Inactive"] = true,
	["Hold Tail Active"] = true,
	["Hold Tail Inactive"] = true,
	["Roll Tail Active"] = true,
	["Roll Tail Inactive"] = true,
};

-- dont forget to close the ret cuz else it wont work ;>
return ret;
