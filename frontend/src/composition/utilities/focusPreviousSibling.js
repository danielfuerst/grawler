export default function focusPreviousSibling(event) {
    const previousSibling = event.target.previousElementSibling;

    if (!previousSibling) {
        return;
    }

    previousSibling.focus();
}
