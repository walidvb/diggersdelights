import React from 'react';
import PropTypes from 'prop-types';
import { FormField} from 'react-form';

import Select from 'react-select/dist/react-select';
import 'react-select/dist/react-select.css';
const styles = require('react-select/dist/react-select.css');

const propTypes = {
    
}

function DDSelect(props) {
    const {
        fieldApi,
        onInput,
        ...rest
      } = props;

    const {
        getValue,
        getError,
        getWarning,
        getSuccess,
        setValue,
        setTouched,
        addOption,
      } = fieldApi;
    
    const { creatable, options } = props;
    const onChange = (e) => {
        setValue(e);
        if(onInput){
            onInput(e)
        }
    }
    const opts = {
        name:"form-field-name",
        value: getValue(),
        multi: props.multiple,
        onChange: onChange,
        options: options,
        ...rest,
    }
    return (
        <div>
            <style>{styles}</style>
            {creatable ? <Select.Creatable {...opts} /> : <Select {...opts} />}
        </div>
    )
}

DDSelect.propTypes = propTypes

export default FormField(DDSelect);
