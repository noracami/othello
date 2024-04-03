# Test if 2 clients can see the same message at the same time

## Description

This milestone is about testing if 2 clients can see the same message at the same time. We can open 2 browsers and see if the message is updated in real-time.

## Given

- 2 clients (browser tabs)
- same page

## When

- Client 1 emits something to the server

## Then

- Client 1 view is updated
- Client 2 view is updated
- Both views are updated at the same time, with the same state
