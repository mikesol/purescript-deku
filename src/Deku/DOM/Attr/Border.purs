module Deku.DOM.Attr.Border where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Object (Object_)
import Deku.DOM.Elt.Table (Table_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Border = Border

instance Attr Img_ Border (NonEmpty.NonEmpty Event.Event  String ) where
  attr Border bothValues = unsafeAttribute $ Both (pure 
    { key: "border", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "border", value: prop' value })
instance Attr Img_ Border (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Border (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "border", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "border", value: prop' value })
instance Attr Img_ Border  String  where
  attr Border value = unsafeAttribute $ This $ pure $
    { key: "border", value: prop' value }
instance Attr Img_ Border (Event.Event  String ) where
  attr Border eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "border", value: prop' value }

instance Attr Img_ Border (ST.ST Global.Global  String ) where
  attr Border iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "border", value: prop' value }

instance Attr Object_ Border (NonEmpty.NonEmpty Event.Event  String ) where
  attr Border bothValues = unsafeAttribute $ Both (pure 
    { key: "border", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "border", value: prop' value })
instance Attr Object_ Border (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Border (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "border", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "border", value: prop' value })
instance Attr Object_ Border  String  where
  attr Border value = unsafeAttribute $ This $ pure $
    { key: "border", value: prop' value }
instance Attr Object_ Border (Event.Event  String ) where
  attr Border eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "border", value: prop' value }

instance Attr Object_ Border (ST.ST Global.Global  String ) where
  attr Border iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "border", value: prop' value }

instance Attr Table_ Border (NonEmpty.NonEmpty Event.Event  String ) where
  attr Border bothValues = unsafeAttribute $ Both (pure 
    { key: "border", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "border", value: prop' value })
instance Attr Table_ Border (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Border (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "border", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "border", value: prop' value })
instance Attr Table_ Border  String  where
  attr Border value = unsafeAttribute $ This $ pure $
    { key: "border", value: prop' value }
instance Attr Table_ Border (Event.Event  String ) where
  attr Border eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "border", value: prop' value }

instance Attr Table_ Border (ST.ST Global.Global  String ) where
  attr Border iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "border", value: prop' value }

instance Attr everything Border (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Border bothValues = unsafeAttribute $ Both (pure 
    { key: "border", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "border", value: unset' })
instance Attr everything Border (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Border (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "border", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "border", value: unset' })
instance Attr everything Border  Unit  where
  attr Border _ = unsafeAttribute $ This $ { key: "border", value: unset' }
instance Attr everything Border (Event.Event  Unit ) where
  attr Border eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "border", value: unset' }

instance Attr everything Border (ST.ST Global.Global  Unit ) where
  attr Border iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "border", value: unset' }
