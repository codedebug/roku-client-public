'*
'* BrightScript doesn't really have inheritance per se, but we'd like to define
'* a base DataLoader class. So define some helper methods for initializing the
'* base properties/methods of a DataLoader.
'*

Sub initDataLoader(loader)
    loader.names = []
    loader.styles = ["square"]

    loader.LoadMoreContent = baseLoadMoreContent
    loader.GetNames = baseGetNames
    loader.GetRowStyles = baseGetRowStyles
    loader.GetLoadStatus = baseGetLoadStatus
    loader.GetPendingRequestCount = baseGetPendingRequestCount
    loader.RefreshData = baseRefreshData
    loader.GetContextAndIndexForItem = baseGetContextAndIndexForItem
    loader.GetPlaceholder = baseGetPlaceholder
    loader.UpdateFilters = baseUpdateFilters

    loader.Listener = invalid
End Sub

'*
'* Load more data either in the currently focused row or the next one that
'* hasn't been fully loaded. The return value indicates whether subsequent
'* rows are already loaded.
'*
Function baseLoadMoreContent(focusedIndex, extraRows=0) As Boolean
    return true
End Function

Function baseGetNames()
    return m.names
End Function

Function baseGetRowStyles()
    return m.styles
End Function

'*
'* Get the load status for a particular row. Possible values are:
'*   0 - Row hasn't started loading
'*   1 - Row is currently loading
'*   2 - Row has finished loading
'*
Function baseGetLoadStatus(row) As Integer
    return 2
End Function

Sub baseRefreshData()
    ' No-op by default, subclasses can override if they have something to refresh.
End Sub

Function baseGetPendingRequestCount() As Integer
    return 0
End Function

Function createDummyLoader()
    loader = CreateObject("roAssociativeArray")
    initDataLoader(loader)
    loader.names[0] = ""
    return loader
End Function

Function baseGetContextAndIndexForItem(row, column)
    return invalid
End Function

Function baseGetPlaceholder(row, empty)
    return invalid
End Function

Sub baseUpdateFilters(updateScreen)
End Sub
