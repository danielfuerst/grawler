export default function focusNextSibling(event) {
    const nextSibling = event.target.nextElementSibling;

    if (!nextSibling) {
        return;
    }

    nextSibling.focus();
}
