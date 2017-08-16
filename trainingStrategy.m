
%% Number of Sessions
singleCycleMonths = 3;
singleCycleWeeks = 3 * 4;
singleCycleDays = singleCycleWeeks*7;
noSessions = floor(singleCycleDays / 2);
noStrengthSessions = floor(noSessions * 0.4);
noSESessions = floor(noSessions * 0.3);
noStamSessions = floor(noSessions * 0.3);

%% Sessions Proportional Breakdown
noStrengthExercises = 4;
noSEExercises = 3;
noStamExercises = 1;

%Strength
campusLadderProportion = (noStrengthSessions / noStrengthExercises);
campusTouchesProportion = (noStrengthSessions / noStrengthExercises);
fingerBoardProportion = (noStrengthSessions / noStrengthExercises);
limitBoulderingProportion = (noStrengthSessions / noStrengthExercises);
% weightedHangsProportion = 0;

%Strength Endurance
boardLapsProportion = (noSESessions / noSEExercises);
fourByFoursProportion = (noSESessions / noSEExercises);
footOnCampusProportion = (noSESessions / noSEExercises);

%Endurance
longCircuits = (noStamSessions / noStamExercises);

%% Create Exercise Arrays
strengthExerciseSet = zeros(1, noStrengthExercises);
for iStrengthRep = 1 : (noStrengthSessions/noStrengthExercises)+1
    strengthExerciseSet = [strengthExerciseSet 1:noStrengthExercises];
end
    strengthExerciseSet = strengthExerciseSet(noStrengthExercises+1 : end);

for iStrengthExercise = 1 : length(strengthExerciseSet)
    strengthExerciseTemp = strengthExerciseSet(iStrengthExercise);
    switch(strengthExerciseTemp)
        case 1
            strengthExerciseList{iStrengthExercise} = 'campusLadder';
        case 2
            strengthExerciseList{iStrengthExercise} = 'campusTouches';
        case 3
            strengthExerciseList{iStrengthExercise} = 'fingerBoard';
        case 4
            strengthExerciseList{iStrengthExercise} = 'limitBouldering';
        otherwise
           strengthExerciseList{iStrengthExercise} = 'woops';
    end
end

SEExerciseSet = zeros(1, noSEExercises);
for iSERep = 1 : (noSESessions/noSEExercises)+1
    SEExerciseSet = [SEExerciseSet 1:noSEExercises];
end
    SEExerciseSet = SEExerciseSet(noSEExercises+1 : end);

for iSEExercise = 1 : length(SEExerciseSet)
    SEExerciseTemp = SEExerciseSet(iSEExercise);
    switch(SEExerciseTemp)
        case 1
            SEExerciseList{iSEExercise} = 'boardLaps';
        case 2
            SEExerciseList{iSEExercise} = 'fourByFours';
        case 3
            SEExerciseList{iSEExercise} = 'footOnCampus';
        otherwise
           SEExerciseList{iSEExercise} = 'woops';
    end
end

StamExerciseSet = zeros(1, noStamExercises);
for iStamRep = 1 : (noStamSessions/noStamExercises)+1
    StamExerciseSet = [StamExerciseSet 1:noStamExercises];
end
    StamExerciseSet = StamExerciseSet(noStamExercises+1 : end);

for iStamExercise = 1 : length(StamExerciseSet)
    StamExerciseTemp = StamExerciseSet(iStamExercise);
    switch(StamExerciseTemp)
        case 1
            StamExerciseList{iStamExercise} = 'longCircuits';
        case 2
            StamExerciseList{iStamExercise} = 'fourByFours';
        case 3
            StamExerciseList{iStamExercise} = 'footOnCampus';
        otherwise
           StamExerciseList{iStamExercise} = 'woops';
    end
end

%% Overload Handling
fingerBoardIntensity = ones(fingerBoardSessions, 1) * (7/3);


%% Failure Modes Handling




%% Sessions Total Split
%Strength
campusLadderSessions = noStrengthSessions * campusSessionsProportion;
fingerBoardSessions = noStrengthSessions * fingerBoardSessionsProportion;

%Strength Endurance
boardLapsSessions = noSESessions * campusSessionsProportion;
fourByFoursSessions = noSESessions * fingerBoardSessionsProportion;

%Endurance
% longCircuits = 1;

%%
% 
% phaseInWeeks = 18;
% daysInWeek = 7;
% baseLoad = [0 1 0 1 0 1 1];
% baseIntensity = 0.4;
% strengthLoad = [0 1 0 1 0 1 0];
% strengthIntensity = 0.9;
% powerLoad = [0 1 0 1 0 1 0];
% powerIntensity = 0.7;
% enduranceLoad = [0 1 1 1 1 0 1];
% enduranceIntensity = 0.2;
% performanceLoad = [1 0 1 0 0 1 1];
% performanceIntensity = 0.6;
% restingLoad = [0 1 0 0 1 0 0];
% restingIntensity = 0.2;
% taperingLoad = [0 0 1 0 0 1 0];
% taperingPerdiod = 1:4*daysInWeek;
% taperingIntensity = (taperingPerdiod / max(taperingPerdiod))./0.7;
% 
% basePhase = [baseLoad baseLoad baseLoad baseLoad] * baseIntensity;
% strengthPhase = [strengthLoad strengthLoad strengthLoad] * strengthIntensity;
% powerPhase = [powerLoad powerLoad powerLoad] * powerIntensity;
% endurancePhase = [enduranceLoad enduranceLoad enduranceLoad] * enduranceIntensity;
% performancePhase = [performanceLoad performanceLoad performanceLoad] * performanceIntensity;
% restingPhase = [restingLoad restingLoad] * restingIntensity;
% % absTrainingLoad = zeros(1, phaseInWeeks * daysInWeek);
% %prototype load
% absTrainingLoad = [basePhase strengthPhase powerPhase endurancePhase performancePhase restingPhase];
% % taperedTrainingLoad = absTrainingLoad * taper;
% g = gausswin(20); % <-- this value determines the width of the smoothing window
% g = g/sum(g);
% smoothedAbsTrainingLoad = conv(absTrainingLoad, g, 'same');
% % plot([1 : phaseInWeeks/(phaseInWeeks*daysInWeek-1) : phaseInWeeks + 1], absTrainingLoad);
% plot([1 : phaseInWeeks/(phaseInWeeks*daysInWeek-1) : phaseInWeeks + 1], smoothedAbsTrainingLoad);

pie([noStrengthSessions noSESessions noStamSessions], {'Strength', 'Strength Endurance', 'Strength'})