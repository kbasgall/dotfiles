# Global Claude Instructions

## Pull Request Style

When writing PR descriptions, follow these guidelines:

### "What is the reason for this pull request?"
- 1-2 sentences. State what changed and why. Don't over-explain. 

### Screenshots
- Include placeholders for where I should put screenshots if it's a frontend PR. 

### Deployment
- Keep it brief. "Not live in production" is fine when behind a flag.
- Don't pad the "Did anything break?" section with obvious non-answers — skip it if there's nothing meaningful to say.

### "Before testing"
- Give concrete setup steps so the reviewer can get to the right state (e.g. "Create a grooming provider using the fixture template", "Impersonate a user who is not yet a provider")
- Don't assume the reviewer knows how to get test data — tell them

### Acceptance tests
- Write as specific user-action scenarios: "Clicking X does Y", "Submitting an empty form renders a validation error"
- Don't write vague acceptance criteria like "the page works correctly"
