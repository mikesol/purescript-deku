module Deku.DOM.Attr.Code where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Applet (Applet_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Code = Code

instance Attr Applet_ Code (NonEmpty.NonEmpty Event.Event  String ) where
  attr Code bothValues = unsafeAttribute $ Both (pure 
    { key: "code", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "code", value: prop' value })
instance Attr Applet_ Code (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Code (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "code", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "code", value: prop' value })
instance Attr Applet_ Code  String  where
  attr Code value = unsafeAttribute $ This $ pure $
    { key: "code", value: prop' value }
instance Attr Applet_ Code (Event.Event  String ) where
  attr Code eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "code", value: prop' value }

instance Attr Applet_ Code (ST.ST Global.Global  String ) where
  attr Code stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "code", value: prop' value }

instance Attr everything Code (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Code bothValues = unsafeAttribute $ Both (pure  { key: "code", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "code", value: unset' })
instance Attr everything Code (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Code (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "code", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "code", value: unset' })
instance Attr everything Code  Unit  where
  attr Code _ = unsafeAttribute $ This $ pure $ { key: "code", value: unset' }
instance Attr everything Code (Event.Event  Unit ) where
  attr Code eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "code", value: unset' }

instance Attr everything Code (ST.ST Global.Global  Unit ) where
  attr Code stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "code", value: unset' }
