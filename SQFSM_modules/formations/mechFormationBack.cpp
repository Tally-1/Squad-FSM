/*
    DOCUMENTATION:
    [_i,_x,_y,_dir]

    [
        index of position,
        x value,
        y value,
        direction when stopped (radiant in PI numbers)
    ]


class Fixed
{
    FormationPositionInfo1[]={-1,  0,0,0}; // formation leader
    
    FormationPositionInfo2[]={0,   0.5,-0.5,  "0.78539816339744830961f"}; // first man after SQL
    
    FormationPositionInfo3[]={1,   0,-0.5,    "-0.78539816339744830961f"};
    FormationPositionInfo4[]={2,   0,-0.5,    "3.14159265358979323846f"};
    FormationPositionInfo5[]={3,   0,-0.5,    "-0.78539816339744830961f"};
    FormationPositionInfo6[]={4,   0,-0.5,    "3.14159265358979323846f"};
};

class Pattern
{
    FormationPositionInfo1[]={-1, -0.5, 1,0}; // "Team Leader"

    FormationPositionInfo2[]={0,   0,-0.5,  "0.78539816339744830961f"};
    FormationPositionInfo3[]={1,   0,-0.5,  "-0.78539816339744830961f"};
    FormationPositionInfo4[]={2,   0,-0.5,  "3.14159265358979323846f"};
};

*/

/*
class Fixed
{
    FormationPositionInfo1[]={-1,  0,0,0};

    FormationPositionInfo2[]={0,   0,-2,  "0.78539816339744830961f"}; // start of first file
    
    // first file formation
    FormationPositionInfo3[]={1,   0,-0.5,  "-0.78539816339744830961f"}; 
    FormationPositionInfo4[]={2,   0,-0.5,  "-0.78539816339744830961f"};
    FormationPositionInfo5[]={3,   0,-0.5,  "-0.78539816339744830961f"};
};

// how all new files will form relative to the previous one
class Pattern
{
    FormationPositionInfo1[]={-1, -1, 1.5,    "3.14159265358979323846f"};

    FormationPositionInfo2[]={0,   0,-0.5,  "-0.78539816339744830961f"};
    FormationPositionInfo3[]={1,   0,-0.5,  "-0.78539816339744830961f"};
    FormationPositionInfo4[]={2,   0,-0.5,  "-0.78539816339744830961f"};
};
class Staggered
                       {
                       class Fixed
                               {
                               FormationPositionInfo1[]={-1, 0, 0, 0};
                               FormationPositionInfo2[]={0,  2,1,  "0.78539816339744830961f"};
                               FormationPositionInfo3[]={1, -2,1,  "-0.78539816339744830961f"};
                               FormationPositionInfo4[]={2,  2,1,  "3.14159265358979323846f"};
                               };

                       class Pattern
                               {
                               FormationPositionInfo1[]={-1, -2,1,   0};
                               FormationPositionInfo2[]={0,   2,1,   "0.78539816339744830961f"};
                               FormationPositionInfo3[]={1,  -2,1,   "-0.78539816339744830961f"};
                               FormationPositionInfo4[]={2,   2,1,   "3.14159265358979323846f"};
                               };

                       };
#include "..\formations\mechFormationBack.cpp"
*/
// this defines how the first units will form
class Fixed
{
    FormationPositionInfo1[]={-1,  0, 0,   0};
    FormationPositionInfo2[]={0,   1,-1,   0}; 
    FormationPositionInfo3[]={1,  -2, 0,   0};
    
    FormationPositionInfo4[]={2,   0.5,-1,   0};
    FormationPositionInfo5[]={3,  -1,   0,   0};
    FormationPositionInfo6[]={4,  -1,   0,   0};
};

// how all new files will form relative to the previous one
class Pattern
{
    FormationPositionInfo1[]={-1,  2,-1,   0};
    FormationPositionInfo2[]={0,  -1, 0,   0};
    FormationPositionInfo3[]={1,  -1, 0,   0};
};

//*/