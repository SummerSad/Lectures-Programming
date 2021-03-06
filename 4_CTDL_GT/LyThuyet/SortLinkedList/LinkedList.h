#ifndef LINKEDLIST_H
#define LINKEDLIST_H

// Typdef before use is OK
// because forward declaration
typedef struct Node *pNode;

struct Node {
	int key;
	pNode pNext;
};

struct List {
	pNode pHead;
	pNode pTail;
};

void initList(List &l);
bool isEmptyList(List l);
pNode getNode(int k);

void addHead(List &l, int k);
void delHead(List &l, int k);

void addTail(List &l, int k);
void addTail(List &l, pNode p);

void insertAfter(List &l, pNode p, int k);
pNode removeAfter(List &l, pNode p);
void delList(List &l);
void printList(List l);
void randList(List &l, int size);

#endif