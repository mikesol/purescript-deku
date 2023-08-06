module Deku.DOM.Attr.Media where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Source (Source_)
import Deku.DOM.Elt.Style (Style_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Media = Media

instance Attr A_ Media  String  where
  attr Media value = unsafeAttribute $ Left $  
    { key: "media", value: prop' value }
instance Attr A_ Media (Event.Event  String ) where
  attr Media eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "media", value: prop' value }


instance Attr Area_ Media  String  where
  attr Media value = unsafeAttribute $ Left $  
    { key: "media", value: prop' value }
instance Attr Area_ Media (Event.Event  String ) where
  attr Media eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "media", value: prop' value }


instance Attr Link_ Media  String  where
  attr Media value = unsafeAttribute $ Left $  
    { key: "media", value: prop' value }
instance Attr Link_ Media (Event.Event  String ) where
  attr Media eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "media", value: prop' value }


instance Attr Source_ Media  String  where
  attr Media value = unsafeAttribute $ Left $  
    { key: "media", value: prop' value }
instance Attr Source_ Media (Event.Event  String ) where
  attr Media eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "media", value: prop' value }


instance Attr Style_ Media  String  where
  attr Media value = unsafeAttribute $ Left $  
    { key: "media", value: prop' value }
instance Attr Style_ Media (Event.Event  String ) where
  attr Media eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "media", value: prop' value }


instance Attr everything Media  Unit  where
  attr Media _ = unsafeAttribute $ Left $  { key: "media", value: unset' }
instance Attr everything Media (Event.Event  Unit ) where
  attr Media eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "media", value: unset' }
