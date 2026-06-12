#include <stdio.h>
#include <stdlib.h>

typedef struct node
{
    int value;
    struct node* next;
}Node;

Node* new_list()
{
    return NULL;
}

Node* push_front(Node* head, int new_value)
{
    Node* n = (Node*)malloc(sizeof(Node));
    n->value = new_value;
    n->next = head;
    return n;
}
Node* push_back(Node* head, int new_value)
{
    Node* n = (Node*)malloc(sizeof(Node));
    n->value = new_value;
    n->next = NULL;
    if (head == NULL)
    {
        return n;
    }
    else
    {
        Node* current = head;
        while (current->next != NULL)
        {
            current = current->next;
        }
        current->next=n;
        return head;
    }
}
Node* pop_front(Node* head)
{
    if (head == NULL)
    {
        return NULL;
    }
    Node* new_head = head->next;
    free(head);
    return new_head;
}
Node* pop_back(Node* head)
{
    if (head == NULL)
    {
        return NULL;
    }
    if (head->next==NULL)
    {
        free(head);
        return NULL;
    }
    else
    {
        Node* current = head;
        while (current->next->next!=NULL)
        {
            current = current->next;
        }
        free(current->next);
        current->next=NULL;
        return head;
    }
}
void print_list(Node* head)
{
    Node* current = head;
    while (current != NULL)
    {
        printf("%d ",current->value);
        current = current->next;
    }
    printf("\n");
}
int main()
{
    Node* list = NULL;
    list = push_front(list, 10);
    print_list(list);
    list = push_back(list, 20);
    print_list(list);
    list = push_front(list, 5);
    print_list(list);
    list = push_back(list,1);
    print_list(list);
    list = pop_back(list);
    print_list(list);
    list = pop_front(list);
    print_list(list);
    return 0;
}
