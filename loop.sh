#!/bin/bash
set -e

ITERATIONS=${1:-1}

echo "Starting task loop ($ITERATIONS iterations)"
echo ""

for ((i=1; i<=$ITERATIONS; i++)); do
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "Iteration $i of $ITERATIONS"
  echo "$(date)"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  
  result=$(droid exec --auto high -f prompt.md 2>&1) || true

  echo "$result"
  echo ""

  if [[ "$result" == *"<done>COMPLETE</done>"* ]]; then
    echo "✅ All tasks complete after $i iterations"
    exit 0
  fi
  
  if [[ "$result" == *"<done>NO_TASKS</done>"* ]]; then
    echo "📭 No open issues"
    exit 0
  fi
  
  if [[ "$result" == *"HANG ON A SECOND"* ]]; then
    echo "⚠️  Task was too large, broke it down"
  fi
done

echo "⏰ Reached iteration limit ($ITERATIONS)"
