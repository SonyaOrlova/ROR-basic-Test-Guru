const setRuleValueOptions = (ruleType) => {
  const ruleValueSelect = document.querySelector('#badge_rule_value');

  if (ruleType) {
    ruleValueSelect.removeAttribute('disabled');

    const ruleValueOptions = ruleValueSelect.options;

    for (let i = 0; i < ruleValueOptions.length; i++) {
      const option = ruleValueOptions[i];

      option.removeAttribute('disabled');

      if (option.dataset.ruleType && option.dataset.ruleType !== ruleType) option.setAttribute('disabled', 'disabled');
    }

    if (ruleValueOptions[ruleValueOptions.selectedIndex].disabled) ruleValueSelect.value = '';
  } else {
    ruleValueSelect.setAttribute('disabled', 'disabled');
  }
}

document.addEventListener('turbolinks:load', () => {
  const ruleTypeSelect = document.querySelector('#badge_rule_type');

  if (!ruleTypeSelect) return;

  const ruleType = ruleTypeSelect.value;

  if (ruleType) setRuleValueOptions(ruleType);

  ruleTypeSelect.addEventListener('change', event => setRuleValueOptions(event.currentTarget.value));
});
