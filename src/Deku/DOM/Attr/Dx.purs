module Deku.DOM.Attr.Dx where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.FeOffset (FeOffset_)
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Dx = Dx

instance Attr FeDropShadow_ Dx (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dx bothValues = unsafeAttribute $ Both (pure 
    { key: "dx", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dx", value: prop' value })
instance Attr FeDropShadow_ Dx (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dx (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "dx", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dx", value: prop' value })
instance Attr FeDropShadow_ Dx  String  where
  attr Dx value = unsafeAttribute $ This $ pure $ { key: "dx", value: prop' value }
instance Attr FeDropShadow_ Dx (Event.Event  String ) where
  attr Dx eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dx", value: prop' value }

instance Attr FeDropShadow_ Dx (ST.ST Global.Global  String ) where
  attr Dx stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "dx", value: prop' value }

instance Attr FeOffset_ Dx (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dx bothValues = unsafeAttribute $ Both (pure 
    { key: "dx", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dx", value: prop' value })
instance Attr FeOffset_ Dx (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dx (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "dx", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dx", value: prop' value })
instance Attr FeOffset_ Dx  String  where
  attr Dx value = unsafeAttribute $ This $ pure $ { key: "dx", value: prop' value }
instance Attr FeOffset_ Dx (Event.Event  String ) where
  attr Dx eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dx", value: prop' value }

instance Attr FeOffset_ Dx (ST.ST Global.Global  String ) where
  attr Dx stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "dx", value: prop' value }

instance Attr Text_ Dx (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dx bothValues = unsafeAttribute $ Both (pure 
    { key: "dx", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dx", value: prop' value })
instance Attr Text_ Dx (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dx (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "dx", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dx", value: prop' value })
instance Attr Text_ Dx  String  where
  attr Dx value = unsafeAttribute $ This $ pure $ { key: "dx", value: prop' value }
instance Attr Text_ Dx (Event.Event  String ) where
  attr Dx eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dx", value: prop' value }

instance Attr Text_ Dx (ST.ST Global.Global  String ) where
  attr Dx stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "dx", value: prop' value }

instance Attr Tspan_ Dx (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dx bothValues = unsafeAttribute $ Both (pure 
    { key: "dx", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dx", value: prop' value })
instance Attr Tspan_ Dx (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dx (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "dx", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dx", value: prop' value })
instance Attr Tspan_ Dx  String  where
  attr Dx value = unsafeAttribute $ This $ pure $ { key: "dx", value: prop' value }
instance Attr Tspan_ Dx (Event.Event  String ) where
  attr Dx eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dx", value: prop' value }

instance Attr Tspan_ Dx (ST.ST Global.Global  String ) where
  attr Dx stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "dx", value: prop' value }

instance Attr everything Dx (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Dx bothValues = unsafeAttribute $ Both (pure  { key: "dx", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "dx", value: unset' })
instance Attr everything Dx (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Dx (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "dx", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "dx", value: unset' })
instance Attr everything Dx  Unit  where
  attr Dx _ = unsafeAttribute $ This $ pure $ { key: "dx", value: unset' }
instance Attr everything Dx (Event.Event  Unit ) where
  attr Dx eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "dx", value: unset' }

instance Attr everything Dx (ST.ST Global.Global  Unit ) where
  attr Dx stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "dx", value: unset' }
