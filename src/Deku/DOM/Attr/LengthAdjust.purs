module Deku.DOM.Attr.LengthAdjust where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data LengthAdjust = LengthAdjust

instance Attr Text_ LengthAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr LengthAdjust bothValues = unsafeAttribute $ Both (pure 
    { key: "lengthAdjust", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "lengthAdjust", value: prop' value })
instance Attr Text_ LengthAdjust (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr LengthAdjust (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "lengthAdjust", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "lengthAdjust", value: prop' value })
instance Attr Text_ LengthAdjust  String  where
  attr LengthAdjust value = unsafeAttribute $ This $ pure $
    { key: "lengthAdjust", value: prop' value }
instance Attr Text_ LengthAdjust (Event.Event  String ) where
  attr LengthAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lengthAdjust", value: prop' value }

instance Attr Text_ LengthAdjust (ST.ST Global.Global  String ) where
  attr LengthAdjust iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "lengthAdjust", value: prop' value }

instance Attr TextPath_ LengthAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr LengthAdjust bothValues = unsafeAttribute $ Both (pure 
    { key: "lengthAdjust", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "lengthAdjust", value: prop' value })
instance Attr TextPath_ LengthAdjust (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr LengthAdjust (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "lengthAdjust", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "lengthAdjust", value: prop' value })
instance Attr TextPath_ LengthAdjust  String  where
  attr LengthAdjust value = unsafeAttribute $ This $ pure $
    { key: "lengthAdjust", value: prop' value }
instance Attr TextPath_ LengthAdjust (Event.Event  String ) where
  attr LengthAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lengthAdjust", value: prop' value }

instance Attr TextPath_ LengthAdjust (ST.ST Global.Global  String ) where
  attr LengthAdjust iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "lengthAdjust", value: prop' value }

instance Attr Tspan_ LengthAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr LengthAdjust bothValues = unsafeAttribute $ Both (pure 
    { key: "lengthAdjust", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "lengthAdjust", value: prop' value })
instance Attr Tspan_ LengthAdjust (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr LengthAdjust (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "lengthAdjust", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "lengthAdjust", value: prop' value })
instance Attr Tspan_ LengthAdjust  String  where
  attr LengthAdjust value = unsafeAttribute $ This $ pure $
    { key: "lengthAdjust", value: prop' value }
instance Attr Tspan_ LengthAdjust (Event.Event  String ) where
  attr LengthAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lengthAdjust", value: prop' value }

instance Attr Tspan_ LengthAdjust (ST.ST Global.Global  String ) where
  attr LengthAdjust iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "lengthAdjust", value: prop' value }

instance Attr everything LengthAdjust (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr LengthAdjust bothValues = unsafeAttribute $ Both (pure 
    { key: "lengthAdjust", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "lengthAdjust", value: unset' })
instance Attr everything LengthAdjust (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr LengthAdjust (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "lengthAdjust", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "lengthAdjust", value: unset' })
instance Attr everything LengthAdjust  Unit  where
  attr LengthAdjust _ = unsafeAttribute $ This $ pure $
    { key: "lengthAdjust", value: unset' }
instance Attr everything LengthAdjust (Event.Event  Unit ) where
  attr LengthAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "lengthAdjust", value: unset' }

instance Attr everything LengthAdjust (ST.ST Global.Global  Unit ) where
  attr LengthAdjust iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "lengthAdjust", value: unset' }
