Public Class CustomerList
    Private customers As List(Of Customer)

    Public Sub New()
        customers = New List(Of Customer)
    End Sub

    Public ReadOnly Property Count As Integer
        Get
            Return customers.Count
        End Get
    End Property

    Default Public Property Item(ByVal index As Integer) As Customer
        Get
            Return customers(index)
        End Get
        Set(ByVal value As Customer)
            customers(index) = value
        End Set
    End Property

    Default Public ReadOnly Property Item(ByVal id As String) As Customer
        Get
            For Each c As Customer In customers
                If c.CustomerID = id Then
                    Return c
                End If
            Next
            Return Nothing
        End Get
    End Property

    Public Shared Function GetCustomer() As CustomerList
        Dim cust As CustomerList = CType(HttpContext.Current.Session("ContactDisplay"), CustomerList)
        If cust Is Nothing Then
            HttpContext.Current.Session("ContactDisplay") = New CustomerList
        End If
        Return CType(HttpContext.Current.Session("ContactDisplay"), CustomerList)
    End Function

    Public Sub AddItem(ByVal customer As Customer)
        customers.Add(customer)
    End Sub

    Public Sub RemoveAT(ByVal index As Integer)
        customers.RemoveAt(index)
    End Sub

    Public Sub Clear()
        customers.Clear()
    End Sub
End Class
