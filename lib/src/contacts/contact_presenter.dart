import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../data/contact_data.dart';
import '../injection/dependency_injection.dart';

abstract class ContactListViewContract {
  void onLoadContactsComplete(List<Contact> items);

  void onLoadContactsError({Widget? error});
}

class ContactListPresenter {
  final ContactListViewContract? _view;
  late ContactRepository _repository;

  ContactListPresenter(this._view) {
    _repository = Injector().contactRepository;
  }

  void loadContacts() {
    assert(_view != null);

    _repository
        .fetch()
        .then((contacts) => _view?.onLoadContactsComplete(contacts))
        .catchError((onError) {
      if (kDebugMode) {
        print(onError);
      }
      _view?.onLoadContactsError();
    });
  }
}
