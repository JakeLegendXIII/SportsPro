Public Class Incident
    Private m_incidentID As Integer
    Private m_customerID As Integer
    Private m_productCode As String
    Private m_TechID As Integer
    Private m_dateOpened As Date
    Private m_dateClosed As Date
    Private m_title As String
    Private m_description As String

    Public Sub New()
    End Sub

    Public Property IncidentID As Integer
        Get
            Return m_incidentID
        End Get
        Set(value As Integer)
            m_incidentID = value
        End Set
    End Property

    Public Property CustomerID As Integer
        Get
            Return m_customerID
        End Get
        Set(value As Integer)
            m_customerID = value
        End Set
    End Property

    Public Property ProductCode As String
        Get
            Return m_productCode
        End Get
        Set(value As String)
            m_productCode = value
        End Set
    End Property

    Public Property TechID As Integer
        Get
            Return m_TechID
        End Get
        Set(value As Integer)
            m_TechID = value
        End Set
    End Property

    Public Property DateOpened As Date
        Get
            Return m_dateOpened
        End Get
        Set(value As Date)
            m_dateOpened = value
        End Set
    End Property

    Public Property DateClosed As Date
        Get
            Return m_dateClosed
        End Get
        Set(value As Date)
            m_dateClosed = value
        End Set
    End Property

    Public Property Title As String
        Get
            Return m_title
        End Get
        Set(value As String)
            m_title = value
        End Set
    End Property

    Public Property Description As String
        Get
            Return m_description
        End Get
        Set(value As String)
            m_description = value
        End Set
    End Property

    'Public IncidentID As Integer
    'Public CustomerID As Integer
    'Public ProductCode As String
    'Public TechID As Integer
    'Public DateOpened As Date
    'Public DateClosed As Date
    'Public Title As String
    'Public Description As String

    Public Function CustomerIncidentDisplay() As String
        Return "Incident for product " + ProductCode + " closed " + DateClosed + " (" + Title + ")"
    End Function

End Class
