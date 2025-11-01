#pagebreak()

== Technical Appendix

== Phase 2

Phase 2 required a more robust and carefully engineered data processing environment, as it involved executing thousands of API queries against both the Google Maps API and the Lumen Transparency Database. This phase was implemented entirely on Amazon Web Services to take advantage of its managed orchestration capabilities, built-in retry logic, and serverless scalability. All infrastructure was provisioned and maintained using the AWS Cloud Development Kit, ensuring reproducibility and version control through Infrastructure-as-Code.

