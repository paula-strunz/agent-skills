# Generate End-to-End Tests

## Purpose

Generate comprehensive end-to-end tests that validate complete user journeys and system interactions. E2E tests verify that the entire system works together correctly: API inputs flow through processing layers, persist to databases, trigger side effects, and produce the expected final output.

## Inputs

- `$ARGUMENTS`: The feature, workflow, or user journey to test end-to-end
- Project context loaded at runtime

## Process

1. **Load project context.**
   Follow **Project Context Loading** from `references/shared-patterns.md` to understand the tech stack, service boundaries, API conventions, and test infrastructure.

2. **Read the feature specification or code.**
   Understand the complete data flow from entry point to final output.

3. **Map the Complete Flow**
   - Entry point (API endpoint, event trigger, CLI command, message queue)
   - Processing steps (services, handlers, pipelines)
   - External integrations (databases, caches, third-party APIs, file storage)
   - Final output and side effects

4. **Identify Test Scenarios**
   - **Primary Use Cases**: Main success paths
   - **Alternative Flows**: Different routing decisions or conditional logic
   - **Error Scenarios**: Invalid inputs, service failures, timeouts
   - **Concurrent Operations**: Race conditions, parallel processing (if applicable)
   - **State Persistence**: Database consistency, cache correctness

5. **Design Test Environment**
   - Docker/container services required
   - Test database setup/teardown
   - Mock external services vs real integrations
   - Test data preparation

6. **Plan Test Execution**
   - Request construction
   - Async completion waiting (if applicable)
   - Result verification across all systems
   - Cleanup procedures

## E2E Test Patterns

Examples use pytest-style syntax. Adapt the structure to the project's existing e2e framework, such as Playwright, Cypress, Jest, Go test, JUnit, or another local convention.

### 1. API to Database Flow

```python
@pytest.mark.e2e
async def test_create_resource_persists_to_database():
    # 1. Submit request
    response = await client.post("/api/resources/", json=test_data)
    assert response.status_code == 201

    # 2. Verify database state
    resource_id = response.json()["id"]
    db_record = await fetch_from_db(resource_id)
    assert db_record.name == test_data["name"]
    assert db_record.status == "active"
```

### 2. Pipeline Execution Flow

```python
@pytest.mark.e2e
async def test_pipeline_processes_input_to_completion():
    # 1. Submit input
    result = await pipeline.run(input_data)

    # 2. Verify each stage executed
    assert result.stages_completed == ["extract", "transform", "load"]

    # 3. Verify final output
    output = await get_pipeline_output(result.id)
    assert output.record_count == expected_count
```

### 3. External Service Integration

```python
@pytest.mark.e2e
async def test_search_returns_results_from_external_service():
    # Test with mocked or real external service
    with mock_external_service(response=sample_response):
        results = await search_service.query("test query")
        assert len(results) > 0
        assert results[0].relevance_score >= 0.5
```

### 4. Error Propagation

```python
@pytest.mark.e2e
async def test_service_failure_returns_appropriate_error():
    with simulate_service_failure("database"):
        response = await client.post("/api/resources/", json=test_data)
        assert response.status_code == 503
        assert "unavailable" in response.json()["detail"].lower()
```

## Test Data Management

### Fixtures for Complex Scenarios

```python
@pytest.fixture
async def seeded_database():
    """Populate test database with known state."""
    await create_test_records(SEED_DATA)
    yield
    await cleanup_test_data()
```

### Factory Functions

```python
def make_test_request(**overrides):
    """Create a test request with sensible defaults."""
    defaults = {"name": "test", "type": "standard", "priority": "normal"}
    return {**defaults, **overrides}
```

## Verification Checklist

1. **API Response**: Status codes, response format, headers
2. **Database State**: Records created/updated/deleted correctly
3. **Processing Pipeline**: All stages completed in order
4. **Business Logic**: Expected transformations applied
5. **Side Effects**: Notifications, logs, cache updates
6. **Cleanup**: Test data removed, no state leaks between tests

## Infrastructure Requirements

For tests requiring full stack:

```python
@pytest.mark.requires_docker
class TestFullSystemFlow:
    @classmethod
    def setup_class(cls):
        # Ensure required services are running
        check_services(["database", "cache", "search"])
```

## Output

Generate test files that:

1. Cover complete user journeys
2. Test integration points thoroughly
3. Verify data consistency across systems
4. Include both success and failure paths
5. Are runnable in CI/CD pipeline

Save to the location specified by the user. If no path is given, follow the project's test directory conventions. Example default for Python projects: `tests/e2e/test_<feature>_e2e.py`.

## Rules

- E2E tests validate system behavior, not unit-level logic. Keep them focused on user-visible outcomes.
- Each test should be independent and not rely on execution order.
- Clean up test data in teardown, not in the next test's setup.
- Follow the Writing Style Rules from shared-patterns.md for any comments or docstrings.
