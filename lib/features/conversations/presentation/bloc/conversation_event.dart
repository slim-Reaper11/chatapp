sealed class ConversationEvent {
  const ConversationEvent();
}

class LoadConversation extends ConversationEvent {
  const LoadConversation();
}

class RefreshConversations extends ConversationEvent {
  const RefreshConversations();
}
