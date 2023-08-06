module Deku.DOM.Attr.OnAbort where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnAbort = OnAbort

instance Attr anything OnAbort (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnAbort bothValues = unsafeAttribute $ Both (pure 
    { key: "abort", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "abort", value: cb' value })
instance Attr anything OnAbort (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnAbort (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "abort", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "abort", value: cb' value })
instance Attr anything OnAbort  Cb  where
  attr OnAbort value = unsafeAttribute $ This $ pure $
    { key: "abort", value: cb' value }
instance Attr anything OnAbort (Event.Event  Cb ) where
  attr OnAbort eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "abort", value: cb' value }

instance Attr anything OnAbort (ST.ST Global.Global  Cb ) where
  attr OnAbort iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "abort", value: cb' value }

instance Attr anything OnAbort (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnAbort bothValues = unsafeAttribute $ Both (pure 
    { key: "abort", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "abort", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnAbort (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnAbort (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "abort", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "abort", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnAbort  (Effect Unit)  where
  attr OnAbort value = unsafeAttribute $ This $ pure $
    { key: "abort", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnAbort (Event.Event  (Effect Unit) ) where
  attr OnAbort eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "abort", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAbort (ST.ST Global.Global  (Effect Unit) ) where
  attr OnAbort iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "abort", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAbort (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnAbort bothValues = unsafeAttribute $ Both (pure 
    { key: "abort", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "abort", value: cb' (Cb (const value)) }
    )
instance Attr anything OnAbort (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnAbort (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "abort", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "abort", value: cb' (Cb (const value)) }
    )
instance Attr anything OnAbort  (Effect Boolean)  where
  attr OnAbort value = unsafeAttribute $ This $ pure $
    { key: "abort", value: cb' (Cb (const value)) }
instance Attr anything OnAbort (Event.Event  (Effect Boolean) ) where
  attr OnAbort eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "abort", value: cb' (Cb (const value)) }

instance Attr anything OnAbort (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnAbort iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "abort", value: cb' (Cb (const value)) }

instance Attr everything OnAbort (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnAbort bothValues = unsafeAttribute $ Both (pure 
    { key: "abort", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "abort", value: unset' })
instance Attr everything OnAbort (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnAbort (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "abort", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "abort", value: unset' })
instance Attr everything OnAbort  Unit  where
  attr OnAbort _ = unsafeAttribute $ This $ { key: "abort", value: unset' }
instance Attr everything OnAbort (Event.Event  Unit ) where
  attr OnAbort eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "abort", value: unset' }

instance Attr everything OnAbort (ST.ST Global.Global  Unit ) where
  attr OnAbort iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "abort", value: unset' }
