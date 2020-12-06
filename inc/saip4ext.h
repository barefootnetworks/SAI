/*
 *
 * @file    saip4ext.h
 *
 * @brief   This module defines SAI P4 Extension interface
 */

#if !defined (__SAIP4EXT_H_)
#define __SAIP4EXT_H_

#include <saitypes.h>

/**
 * @brief Attribute Id for sai_p4_ext_table
 *
 * @flags Contains flags
 */
typedef enum _sai_p4_ext_table_attr_t
{
    /**
     * @brief Table attributes start
     */
    SAI_P4_TABLE_ATTR_START,

    /**
     * @brief 
     * Action ID to set as default action for table
     * @type sai_s8_list_t
     */
    SAI_P4_TABLE_ATTR_DEFAULT_ACTION = SAI_P4_TABLE_ATTR_START,

    /**
     * @brief End of P4 Table attributes
     */
    SAI_P4_TABLE_ATTR_END,

    /**
     * @brief Custom range base value start
     */
    SAI_P4_TABLE_ATTR_CUSTOM_RANGE_START = 0x10000000,

    /**
     * @brief End of Custom range base
     */
    SAI_P4_TABLE_ATTR_CUSTOM_RANGE_END

} sai_p4_ext_table_attr_t;


/**
 * @brief Set P4 table attribute
 *
 * @param[in] p4_table_id The P4 table id
 * @param[in] attr Attribute
 *
 * @return #SAI_STATUS_SUCCESS on success, failure status code on error
 */
typedef sai_status_t (*sai_set_p4_ext_table_attribute_fn)(
        _In_ sai_uint32_t p4_table_id,
        _In_ const sai_attribute_t *attr);

/**
 * @brief Get P4 table attribute
 *
 * @param[in] p4_table_id P4 table id
 * @param[in] attr_count Number of attributes
 * @param[inout] attr_list Array of attributes
 *
 * @return #SAI_STATUS_SUCCESS on success, failure status code on error
 */
typedef sai_status_t (*sai_get_p4_ext_table_attribute_fn)(
        _In_ sai_uint32_t p4_table_id,
        _In_ uint32_t attr_count,
        _Inout_ sai_attribute_t *attr_list);

/**
 * @brief Attribute Id for sai_p4_ext_entry
 *
 * @flags Contains flags
 */
typedef enum _sai_p4_ext_entry_attr_t
{
    /**
     * @brief Start of P4 Entry attributes
     */
    SAI_P4_EXT_ENTRY_ATTR_START,

    /**
     * @brief SAI P4 EXT table object id
     *
     * @type sai_uint32_t
     * @flags CREATE_AND_SET
     */
    SAI_P4_EXT_ENTRY_ATTR_TABLE_ID = SAI_P4_EXT_ENTRY_ATTR_START,

    /**
     * @brief SAI P4 EXT Match field
     *
     * @type sai_s8_list_t
     * @flags CREATE_AND_SET
     */
    SAI_P4_EXT_ENTRY_ATTR_MATCH_FIELD_ID,

    /**
     * @brief SAI P4 EXT Action id
     *
     * @type sai_uint32_t
     * @flags CREATE_AND_SET
     */
    SAI_P4_EXT_ENTRY_ATTR_ACTION_ID,

    /**
     * @brief SAI P4 EXT Action parameters
     *
     * @type sai_s8_list_t
     * @flags CREATE_AND_SET
     */
    SAI_P4_EXT_ENTRY_ATTR_PARAMETER_ID,

    /** Custom range base value */
    SAI_P4_EXT_ENTRY_ATTR_CUSTOM_RANGE_START = 0x10000000,

    /** End of custom range base */
    SAI_P4_EXT_ENTRY_ATTR_CUSTOM_RANGE_END

} sai_p4_ext_entry_attr_t;


/**
 * @brief Create an P4 table entry
 *
 * @param[out] p4_entry_id The P4 entry id
 * @param[in] switch_id The Switch Object id
 * @param[in] attr_count Number of attributes
 * @param[in] attr_list Array of attributes
 *
 * @return #SAI_STATUS_SUCCESS on success, failure status code on error
 */
typedef sai_status_t (*sai_create_p4_ext_entry_fn)(
        _Out_ sai_object_id_t *p4_entry_id,
        _In_ sai_object_id_t switch_id,
        _In_ uint32_t attr_count,
        _In_ const sai_attribute_t *attr_list);

/**
 * @brief Delete an P4 entry
 *
 * @param[in] p4_entry_id The P4 entry id
 *
 * @return #SAI_STATUS_SUCCESS on success, failure status code on error
 */
typedef sai_status_t (*sai_remove_p4_ext_entry_fn)(
        _In_ sai_object_id_t p4_entry_id);

/**
 * @brief Set P4 Table entry attribute
 *
 * @param[in] p4_entry_id The P4 entry id
 * @param[in] attr Attribute
 *
 * @return #SAI_STATUS_SUCCESS on success, failure status code on error
 */
typedef sai_status_t (*sai_set_p4_ext_entry_attribute_fn)(
        _In_ sai_object_id_t p4_entry_id,
        _In_ const sai_attribute_t *attr);

/**
 * @brief Get P4 entry attribute
 *
 * @param[in] p4_entry_id P4 entry id
 * @param[in] attr_count Number of attributes
 * @param[inout] attr_list Array of attributes
 *
 * @return #SAI_STATUS_SUCCESS on success, failure status code on error
 */
typedef sai_status_t (*sai_get_p4_ext_entry_attribute_fn)(
        _In_ sai_object_id_t p4_entry_id,
        _In_ uint32_t attr_count,
        _Inout_ sai_attribute_t *attr_list);

/**
 * @brief P4_Ext  methods table retrieved with sai_api_query()
 */
typedef struct _sai_p4_ext_api_t
{
    sai_create_p4_ext_entry_fn                     create_p4_ext_entry;
    sai_remove_p4_ext_entry_fn                     remove_p4_ext_entry;
    sai_set_p4_ext_entry_attribute_fn              set_p4_ext_entry_attribute;
    sai_get_p4_ext_entry_attribute_fn              get_p4_ext_entry_attribute;

    sai_set_p4_ext_table_attribute_fn              set_p4_ext_table_attribute;
    sai_get_p4_ext_table_attribute_fn              get_p4_ext_table_attribute;
} sai_p4_ext_api_t;

/**
 * @}
 */
#endif /** __SAIP4EXT_H_ */
