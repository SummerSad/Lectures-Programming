#include "LinkedList.h"
#include <iostream>
#include <random>
#include <time.h>

using namespace std;

void initList(List &l)
{
	l.pHead = NULL;
	l.pTail = NULL;
}

bool isEmptyList(List l)
{
	return l.pHead == NULL && l.pTail == NULL;
}

pNode getNode(int k)
{
	pNode temp = new Node;
	if (!temp) {
		cout << "Khong tao duoc Node" << endl;
	}
	temp->key = k;
	temp->pNext = NULL;
	return temp;
}

void addHead(List &l, int k)
{
	if (isEmptyList(l)) {
		l.pHead = getNode(k);
		l.pTail = l.pHead;
	} else {
		Node *temp = getNode(k);
		temp->pNext = l.pHead;
		l.pHead = temp;
	}
}

void delHead(List &l)
{
	if (isEmptyList(l)) {
		return;
	}
	if (l.pHead == l.pTail) {
		delete l.pHead;
		l.pHead = NULL;
		l.pTail = NULL;
	} else {
		Node *temp = l.pHead;
		l.pHead = l.pHead->pNext;
		delete temp;
	}
}

void addTail(List &l, int k)
{
	if (isEmptyList(l)) {
		addHead(l, k);
	} else {
		pNode temp = getNode(k);
		l.pTail->pNext = temp;
		l.pTail = temp;
	}
}

void addTail(List &l, pNode p)
{
	if (isEmptyList(l)) {
		l.pHead = p;
		l.pTail = p;
	} else {
		l.pTail->pNext = p;
		l.pTail = p;
	}
	l.pTail->pNext = NULL; // Ensure
}

// p->q(k)
void insertAfter(List &l, pNode p, int k)
{
	if (isEmptyList(l) || p == NULL) {
		return;
	}
	pNode q = getNode(k);
	q->pNext = p->pNext;
	p->pNext = q;
	// Neu q duoc them vao tail
	if (q->pNext == NULL) {
		l.pTail = q;
	}
}

pNode removeAfter(List &l, pNode p)
{
	if (isEmptyList(l) || p == NULL || p->pNext == NULL) {
		return NULL;
	}
	pNode temp = p->pNext;
	p->pNext = temp->pNext;
	if (p->pNext == NULL) {
		l.pTail = p;
	}
	return temp;
}

void delList(List &l)
{
	while (l.pHead) {
		delHead(l);
	}
}

void printList(List l)
{
	while (l.pHead && l.pHead != l.pTail->pNext) {
		cout << l.pHead->key << "->";
		l.pHead = l.pHead->pNext;
	}
	if (!l.pTail->pNext) {
		cout << "NULL" << endl;
	} else {
		cout << l.pTail->pNext->key << ".." << endl;
	}
}

void randList(List &l, int size)
{
	srand(time(NULL));
	const int RAND_SIZE = 100;
	for (int i = 0; i < size; ++i) {
		addHead(l, rand() % RAND_SIZE);
	}
}