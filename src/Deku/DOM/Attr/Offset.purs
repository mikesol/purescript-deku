module Deku.DOM.Attr.Offset where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Stop (Stop_)
import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Offset = Offset

instance Attr FeFuncA_ Offset (NonEmpty.NonEmpty Event.Event  String ) where
  attr Offset bothValues = unsafeAttribute $ Both (pure 
    { key: "offset", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "offset", value: prop' value })
instance Attr FeFuncA_ Offset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Offset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "offset", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "offset", value: prop' value })
instance Attr FeFuncA_ Offset  String  where
  attr Offset value = unsafeAttribute $ This $ pure $
    { key: "offset", value: prop' value }
instance Attr FeFuncA_ Offset (Event.Event  String ) where
  attr Offset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "offset", value: prop' value }

instance Attr FeFuncA_ Offset (ST.ST Global.Global  String ) where
  attr Offset stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "offset", value: prop' value }

instance Attr FeFuncB_ Offset (NonEmpty.NonEmpty Event.Event  String ) where
  attr Offset bothValues = unsafeAttribute $ Both (pure 
    { key: "offset", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "offset", value: prop' value })
instance Attr FeFuncB_ Offset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Offset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "offset", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "offset", value: prop' value })
instance Attr FeFuncB_ Offset  String  where
  attr Offset value = unsafeAttribute $ This $ pure $
    { key: "offset", value: prop' value }
instance Attr FeFuncB_ Offset (Event.Event  String ) where
  attr Offset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "offset", value: prop' value }

instance Attr FeFuncB_ Offset (ST.ST Global.Global  String ) where
  attr Offset stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "offset", value: prop' value }

instance Attr FeFuncG_ Offset (NonEmpty.NonEmpty Event.Event  String ) where
  attr Offset bothValues = unsafeAttribute $ Both (pure 
    { key: "offset", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "offset", value: prop' value })
instance Attr FeFuncG_ Offset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Offset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "offset", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "offset", value: prop' value })
instance Attr FeFuncG_ Offset  String  where
  attr Offset value = unsafeAttribute $ This $ pure $
    { key: "offset", value: prop' value }
instance Attr FeFuncG_ Offset (Event.Event  String ) where
  attr Offset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "offset", value: prop' value }

instance Attr FeFuncG_ Offset (ST.ST Global.Global  String ) where
  attr Offset stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "offset", value: prop' value }

instance Attr FeFuncR_ Offset (NonEmpty.NonEmpty Event.Event  String ) where
  attr Offset bothValues = unsafeAttribute $ Both (pure 
    { key: "offset", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "offset", value: prop' value })
instance Attr FeFuncR_ Offset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Offset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "offset", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "offset", value: prop' value })
instance Attr FeFuncR_ Offset  String  where
  attr Offset value = unsafeAttribute $ This $ pure $
    { key: "offset", value: prop' value }
instance Attr FeFuncR_ Offset (Event.Event  String ) where
  attr Offset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "offset", value: prop' value }

instance Attr FeFuncR_ Offset (ST.ST Global.Global  String ) where
  attr Offset stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "offset", value: prop' value }

instance Attr Stop_ Offset (NonEmpty.NonEmpty Event.Event  String ) where
  attr Offset bothValues = unsafeAttribute $ Both (pure 
    { key: "offset", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "offset", value: prop' value })
instance Attr Stop_ Offset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Offset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "offset", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "offset", value: prop' value })
instance Attr Stop_ Offset  String  where
  attr Offset value = unsafeAttribute $ This $ pure $
    { key: "offset", value: prop' value }
instance Attr Stop_ Offset (Event.Event  String ) where
  attr Offset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "offset", value: prop' value }

instance Attr Stop_ Offset (ST.ST Global.Global  String ) where
  attr Offset stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "offset", value: prop' value }

instance Attr everything Offset (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Offset bothValues = unsafeAttribute $ Both (pure 
    { key: "offset", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "offset", value: unset' })
instance Attr everything Offset (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Offset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "offset", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "offset", value: unset' })
instance Attr everything Offset  Unit  where
  attr Offset _ = unsafeAttribute $ This $ pure $ { key: "offset", value: unset' }
instance Attr everything Offset (Event.Event  Unit ) where
  attr Offset eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "offset", value: unset' }

instance Attr everything Offset (ST.ST Global.Global  Unit ) where
  attr Offset stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "offset", value: unset' }
