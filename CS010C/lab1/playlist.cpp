#include <iostream>
using namespace std;
#include "Playlist.h"


PlaylistNode::PlaylistNode() {
    uniqueID = "none";
    songName = "none";
    artistName = "none";
    songLength = 0;
    nextNodePtr = 0;
}

PlaylistNode::PlaylistNode(string newUniqueID,
		string newSongName,
		string newArtistName,
		int newSongLength) {
	uniqueID = newUniqueID;
    songName = newSongName;
    artistName = newArtistName;
    songLength = newSongLength;
    nextNodePtr = 0;
}

void PlaylistNode::InsertAfter(PlaylistNode* value)
{
    PlaylistNode* tmp = nextNodePtr;
    nextNodePtr = value;
    value->SetNext(tmp);
}

void PlaylistNode::SetNext(PlaylistNode* value){
	nextNodePtr = value;
}

string PlaylistNode::GetID() const{ 
	return uniqueID;
	}
string PlaylistNode::GetSongName()const{
	return artistName;
}
string PlaylistNode::GetArtistName() const{
    return artistName;
}

int PlaylistNode::GetSongLength() const{
    return songLength;
}

PlaylistNode* PlaylistNode::GetNext() const{
    return nextNodePtr;
}
