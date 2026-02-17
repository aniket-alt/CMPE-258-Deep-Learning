Pomodoro Timer Verification Walkthrough
Completed Features
Timer Logic: 25/5/15 minute intervals with auto-switching.
Editable Timer: Directly click the timer (MM:SS) to edit the duration.
Visuals: Tomato Red for work, Green for breaks.
Controls: Start/Pause, Reset buttons.
Settings: Default durations can still be set in settings.
Responsiveness: Mobile-friendly layout.
Extras: Session counter, Audio alert, Dark/Light mode.
How to Verify
1. Open the Application
Open 
index.html
 in your web browser.

2. Test Direct Editing
Click on the time "25:00". It should highlight/cursor should appear.
Type 40 and press Enter.
Verify: Display changes to 40:00.
Verify: Progress ring resets to full.
Click "Start".
Verify: Timer counts down from 40 minutes.
Click Pause. Edit again. Type 1:30.
Verify: Display updates to 01:30 (1 min 30 sec).
Verify: Start resumes from 1:30.
3. Test Mode Switching & Persistence
Switch to "Short Break".
Time automatically updates to standard settings (e.g., 05:00).
Edit Short Break time to 10.
Time becomes 10:00.
Switch away to "Pomodoro" and back to "Short Break".
Verify: It resets to the Setting default (5:00). Direct edits are one-off for the current session (unless we decided to persist, but current logic is one-off).
4. Standard Tests
Run timer to 0 to check Audio and Auto-switch.
Check Dark/Light mode.
Check Responsive layout.