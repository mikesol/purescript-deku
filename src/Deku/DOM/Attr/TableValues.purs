module Deku.DOM.Attr.TableValues where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data TableValues = TableValues

instance Attr FeFuncA_ TableValues  String  where
  attr TableValues value = unsafeAttribute $ Left $  
    { key: "tableValues", value: prop' value }
instance Attr FeFuncA_ TableValues (Event.Event  String ) where
  attr TableValues eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "tableValues", value: prop' value }


instance Attr FeFuncB_ TableValues  String  where
  attr TableValues value = unsafeAttribute $ Left $  
    { key: "tableValues", value: prop' value }
instance Attr FeFuncB_ TableValues (Event.Event  String ) where
  attr TableValues eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "tableValues", value: prop' value }


instance Attr FeFuncG_ TableValues  String  where
  attr TableValues value = unsafeAttribute $ Left $  
    { key: "tableValues", value: prop' value }
instance Attr FeFuncG_ TableValues (Event.Event  String ) where
  attr TableValues eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "tableValues", value: prop' value }


instance Attr FeFuncR_ TableValues  String  where
  attr TableValues value = unsafeAttribute $ Left $  
    { key: "tableValues", value: prop' value }
instance Attr FeFuncR_ TableValues (Event.Event  String ) where
  attr TableValues eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "tableValues", value: prop' value }


instance Attr everything TableValues  Unit  where
  attr TableValues _ = unsafeAttribute $ Left $  
    { key: "tableValues", value: unset' }
instance Attr everything TableValues (Event.Event  Unit ) where
  attr TableValues eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "tableValues", value: unset' }
