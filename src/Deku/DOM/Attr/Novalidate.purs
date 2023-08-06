module Deku.DOM.Attr.Novalidate where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Novalidate = Novalidate

instance Attr Form_ Novalidate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Novalidate bothValues = unsafeAttribute $ Both (pure 
    { key: "novalidate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "novalidate", value: prop' value })
instance Attr Form_ Novalidate (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Novalidate (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "novalidate", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "novalidate", value: prop' value })
instance Attr Form_ Novalidate  String  where
  attr Novalidate value = unsafeAttribute $ This $ pure $
    { key: "novalidate", value: prop' value }
instance Attr Form_ Novalidate (Event.Event  String ) where
  attr Novalidate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "novalidate", value: prop' value }

instance Attr Form_ Novalidate (ST.ST Global.Global  String ) where
  attr Novalidate iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "novalidate", value: prop' value }

instance Attr everything Novalidate (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Novalidate bothValues = unsafeAttribute $ Both (pure 
    { key: "novalidate", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "novalidate", value: unset' })
instance Attr everything Novalidate (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Novalidate (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "novalidate", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "novalidate", value: unset' })
instance Attr everything Novalidate  Unit  where
  attr Novalidate _ = unsafeAttribute $ This $ pure $
    { key: "novalidate", value: unset' }
instance Attr everything Novalidate (Event.Event  Unit ) where
  attr Novalidate eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "novalidate", value: unset' }

instance Attr everything Novalidate (ST.ST Global.Global  Unit ) where
  attr Novalidate iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "novalidate", value: unset' }
