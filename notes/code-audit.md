
 * You are guinea pigs

Goals
-----

 * it is not questioning the skill of the other person
 * it is to provide more eyes - you might miss something - we all do
 * is it maintainable - need more eyes
 * everyone is clever - there is no need to prove it with complicated code
 * complexity is a balance - comment well - explain why

 * use tools
 * PEP8 complienace is for static analysis tools, not reviews

Approach
--------

 * review your own code first
   * are there obvious questions someone would ask you
 * push back on large code reviews - break into smaller pieces
 * if it appears difficult to understand it is hard to maintain
   * at least require some comment about the problem or approach
     (frequently describing the case will uncover issues before you pass it to the auditor)
   * sometimes push for a simplified or clarified implementation
   * sometimes the problem is complex

 * it is always easier when you provided the guidance for what is to be done

<!--
 * Ask questions: How does this method work? If this requirement
   changes, what else would have to change? How could we make this
   more maintainable?

 * Compliment / reinforce good practices: One of the most important
   parts of the code review is to reward developers for growth and
   effort. Few things feel better than getting praise from a peer. I
   try to offer as many positive comments as possible.

 * Discuss in person for more detailed points: On occasion, a
   recommended architectural change might be large enough that it’s
   easier to discuss it in person rather than in the comments.
   Similarly, if I’m discussing a point and it goes back and forth,
   I’ll often pick it up in person and finish out the discussion.

 * Explain reasoning: I find it’s best both to ask if there’s a
   better alternative and justify why I think it’s worth fixing.
   Sometimes it can feel like the changes suggested can seem nit-picky
   without context or explanation.

 * Make it about the code: It’s easy to take notes from code reviews
   personally, especially if we take pride in our work. It’s best, I
   find, to make discussions about the code than about the developer.
   It lowers resistance and it’s not about the developer anyway, it’s
   about improving the quality of the code.

 * Suggest importance of fixes: I tend to offer many suggestions,
   not all of which need to be acted upon. Clarifying if an item is
   important to fix before it can be considered done is useful both
   for the reviewer and the reviewee. It makes the results of a review
   clear and actionable.
-->

Questions to Ask
----------------

 * what static analysis was performed
 * what testing was performed
   * why was it relevant
   * if it was for a specific bug - how was the fix verified
 * ask for clarification

 * what are the interactions with the rest of the system
   * the author may not know
   * you may not know
   * ask
 * are there implications to other componenets
 * are there performance (memory or processing) issues
 * are there scale complexity issues
   * example - Heck dependency code, vs topo sort
 * is there an opportunity for reuse that was missed
 * is it generalized well enough
 * does it break abstractions
   * no interface bleed through
   * impacts ability to mock

 * "single responsibility" - have the piece do one thing - not 10 args to do a bunch of things
   * char *cmd - if (strcmp(cmd) -- do
 * all cases habndled - fall thru
 * is there sufficient error handling
   * do NOT catch Exception - be specific
 * names are clear - be long - and explanatory
   * buy a thesaurus
 * single page for a function - refactor otherwise
   * worst example - TCP receive in the kernel
 * more than 3 arguments should be scrutinized

 * tendency is to put all errors in one place - sometimes it is better to create the errors where they are used (dogma)

 * Do not change whitespace at the same time as function
 * boomerang code
 * logic statements - more than 2 is not easily understood
 * eliminate the edge cases and return
 * refactor to allow for easier comprehension
 * be liberal with whitespace
   * if then else return are not functions - close parens makes that confusing
   * be extra careful with dynamic languages

 * ALWAYS AVOID DOGMA
   * goto is bad
   * globals are bad
   * odd constructs are bad
   * everything must always pass lint

