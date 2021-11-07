/*!
 * FileInput Chinese Translations
 *
 * This file must be loaded after 'fileinput.js'. Patterns in braces '{}', or
 * any HTML markup tags in the messages must not be converted or translated.
 *
 * @see http://github.com/kartik-v/bootstrap-fileinput
 * @author kangqf <kangqingfei@gmail.com>
 *
 * NOTE: this file must be saved in UTF-8 encoding.
 */
(function ($) {
    "use strict";

    $.fn.fileinput.locales.zh = {
        fileSingle: 'file',
        filePlural: 'mulitfiel',
        browseLabel: 'select&hellip;',
        removeLabel: 'remove',
        removeTitle: 'clear',
        cancelLabel: 'cancel',
        cancelTitle: 'cancel uploading',
        uploadLabel: 'upload',
        uploadTitle: 'upload files',
        msgSizeTooLarge: 'file "{name}" (<b>{size} KB</b>) size too large<b>{maxSize} KB</b>. 请重新上传!',
        msgFilesTooLess: 'filesize less than <b>{n}</b> {files} . please upload again!',
        msgFilesTooMany: '选择的上传文件个数 <b>({n})</b> 超出最大文件的限制个数 <b>{m}</b>. 请重新上传!',
        msgFileNotFound: 'file "{name}"doesnt exist!',
        msgFileSecured: '安全限制，为了防止读取文件 "{name}".',
        msgFileNotReadable: 'file "{name}" cannot be read.',
        msgFilePreviewAborted: 'cancel "{name}" preview.',
        msgFilePreviewError: 'reading "{name}" occurs an error.',
        msgInvalidFileType: 'unsupportable file type "{name}".  "{types}" needed.',
        msgInvalidFileExtension: 'unsupportable file extending type"{name}".  "{extensions}" needed.',
        msgValidationError: 'upload failed',
        msgLoading: '加载第 {index} 文件 共 {files} &hellip;',
        msgProgress: '加载第 {index} 文件 共 {files} - {name} - {percent}% 完成.',
        msgSelected: '{n} {files} 选中',
        msgFoldersNotAllowed: '只支持拖拽文件! 跳过 {n} 拖拽的文件夹.',
        dropZoneTitle: '拖拽文件到这里 &hellip;',
        slugCallback: function(text) {
            return text ? text.split(/(\\|\/)/g).pop().replace(/[^\w\u4e00-\u9fa5\-.\\\/ ]+/g, '') : '';
        }
    };

    $.extend($.fn.fileinput.defaults, $.fn.fileinput.locales.zh);
})(window.jQuery);
