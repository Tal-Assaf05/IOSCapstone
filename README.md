![Wireframing](https://github.com/user-attachments/assets/81c5f275-26c9-4b66-aa6a-0917f9a99e58)![Wireframing](https://github.com/user-attachments/assets/6e0b5a3b-b1fc-4d21-95ba-1da2e6d785dc)![Wireframing](https://github.com/user-attachments/assets/0fe42e4a-d9c2-42aa-b065-8ca69ba101cd)Original App Design Project - README Template
===

# ShiftSheet

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

ShiftSheet is a clean, modern iOS productivity app designed for freelancers, private tutors, babysitters, and shift-based workers who need to log jobs, track earnings, and monitor payment statuses easily. Users can save regular job templates, quickly add shifts, and view earnings summaries — all without needing complicated spreadsheets.

### App Evaluation

- **Category:** Productivity / Finance
- **Mobile:** Fully mobile-first, uses SwiftUI, local storage (UserDefaults).
- **Story:** Simplifies shift tracking for freelancers and private workers who often juggle multiple clients.
- **Market:** Tutors, babysitters, pet sitters, freelancers — anyone managing shifts independently.
- **Habit:** Used every shift or week for logging and reviewing payment status.
- **Scope:** Small and focused for a single developer. Core features fully implemented without server sync.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can add a new shift template (customer name, rate, notes)
* User can view all saved shift templates
* User can add a shift based on a saved template
* User can view a calendar and see shifts by date
* User can delete a shift
* User can see total earnings, unpaid balance, total hours
* User data is saved locally with persistence

**Optional Nice-to-have Stories**

* Show shifts highlighted on the calendar
* Allow editing of saved job templates
* Add haptic feedback when saving shifts
* Customize app color themes

### 2. Screen Archetypes

- [x] Home Screen (Calendar View)
* View calendar
* Tap a date to see shifts logged on that day
* Add a shift from the calendar view

- [x] Add Tab (Job Templates Screen)
* View existing job templates
* Add a new job template
* Tap a template to quickly create a shift

- [x] Summary Screen
* See total shifts, total hours, total earnings, unpaid balance
* Navigate to full shift list view from "Total Shifts"

- [x] Shift List (Launched from Summary)
* Full list of all logged shifts
* Delete shifts if needed

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home (Calendar)
* Add (Manage Job Templates)
* Summary (Dashboard)

**Flow Navigation** (Screen to Screen)

- [x] Home → Add Shift Modal
* Select date → Create shift

- [x] Summary → Full Shift List
* Tap Total Shifts → See all shifts

- [x] Add → Add New Job Template Modal
* Tap "Add New Job" → Create new template

- [x] Tapping a job template → Add Shift for that customer
* Pre-fill customer info into shift

## Wireframes

[Add picture of your hand sketched wireframes in this section]
<img src="https://github.com/user-attachments/assets/297bb872-29bb-4c61-a754-14dfd8e55f21" width=600> 


### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 

[This section will be completed in Unit 9]

### Models

| Model        | Properties |
|--------------|------------|
| Shift        | id, date, startTime, endTime, customerName, hourlyRate, notes, isPaid |
| JobTemplate  | id, customerName, defaultRate, notes |

### Networking

- No external networking (app is local only)
